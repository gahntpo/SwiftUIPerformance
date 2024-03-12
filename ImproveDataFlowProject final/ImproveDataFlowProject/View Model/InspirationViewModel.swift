//
//  InspirationViewModel.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 18.02.24.
//

import Foundation
import Combine

class InspirationViewModel: ObservableObject {
    
    @Published var inspirations = NatureInspiration.examples() 
    @Published var timeRemaining: Date = Date()
    
    var subscription: AnyCancellable? = nil
    
    init() {
       // setupTimer()
    }
    
    func toggleTimer() {
        if subscription == nil {
            let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            subscription = timer.assign(to: \.timeRemaining, on: self)
        } else {
            subscription = nil
        }
    }
    
    func fetchMoreData() {
        // do something
    }
}
