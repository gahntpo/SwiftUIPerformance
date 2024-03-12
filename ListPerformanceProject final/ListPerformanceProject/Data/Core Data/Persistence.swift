//
//  Persistence.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ListPerformanceProject")
        
        if inMemory || UITestingHelper.isUITesting  {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        
        if let testNumber = UITestingHelper.stressTestNumber {
            PersistenceController.addTestData(testNumber: testNumber, in: container.viewContext)
        }
    }
    
    //MARK: - Testing
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        PersistenceController.addTestData(testNumber: 1000, in: viewContext)
        
        return result
    }()
    
    static func addTestData(testNumber: Int, in viewContext: NSManagedObjectContext) {
        let endDate = Date()
        let startDate = endDate.goBack(days: 100)
        
        for number in 0..<testNumber {
            let category = Category.allCases.randomElement() ?? .personal
            let isDone = [true, false].randomElement() ?? false
            let date = Date.generateRandomDate(from: startDate, to: endDate) ?? Date()
            
            
            _ = CDTask(title: "task \(number) for \(category)",
                       isDone: isDone,
                       category: category,
                       creationDate: date,
                       context: viewContext)
        }
    }
}
