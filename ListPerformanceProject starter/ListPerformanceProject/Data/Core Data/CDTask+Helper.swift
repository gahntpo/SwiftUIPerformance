//
//  CDTask+Helper.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import Foundation
import CoreData

extension CDTask {
    
    var uuid: UUID {
        #if DEBUG
        return uuid_!
        #else
        return uuid_ ?? UUID()
        #endif
    }
    
    var title: String {
        get { self.title_ ?? "" }
        set { self.title_ = newValue  }
    }
    
    var creationDate: Date {
        get { creationDate_ ?? Date() }
    }
    
    var category: Category {
        get {
            if let rawStatus = category_,
              let category = Category(rawValue: rawStatus){
                return category
            } else {
                return Category.personal
            }
        }
        set {
            category_ = newValue.rawValue
        }
    }
    
    //MARK: - init
    
    convenience init(title: String, 
                     isDone: Bool = false,
                     category: Category = .personal,
                     creationDate: Date = Date(),
                     context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.category = category
        self.isDone = isDone
        self.creationDate_ = creationDate
    }
 
    public override func awakeFromInsert() {
        self.creationDate_ = Date()
        self.uuid_ = UUID()
    }
    
    //MARK: - fetch
    
    static func fetch(_ predicate: NSPredicate) -> NSFetchRequest<CDTask> {
        let request = CDTask.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDTask.creationDate_,
                                                    ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func nsSortDescriptor(for sorting: TaskSorting) -> [NSSortDescriptor] {
        let defaultSorting = NSSortDescriptor(keyPath: \CDTask.creationDate_,
                                              ascending: true)
        switch sorting {
            case .creationDateAsc:
                return [defaultSorting]
            case .creationDateDes:
                return [NSSortDescriptor(keyPath: \CDTask.creationDate_, ascending: false)]
            case .titleAsc:
                return [NSSortDescriptor(keyPath: \CDTask.title_, ascending: true), defaultSorting]
            case .titleDes:
                return [NSSortDescriptor(keyPath: \CDTask.title_, ascending: false), defaultSorting]
        }
        
    }
    
    //MARK: - preview
    
    static func example() -> CDTask {
        let context = PersistenceController.preview.container.viewContext
        let task = CDTask(title: "Example Task", context: context)
        return task
    }
}
