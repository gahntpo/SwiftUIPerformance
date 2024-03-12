//
//  ObservationData.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 18.02.24.
//

import Foundation
import Observation
import Combine

@Observable
class ObservationData {
    
    var inspirations = ObservationNatureInspiration.examples()
    
    var timeRemaining: Date = Date()
    
    var subscription: AnyCancellable? = nil
    
    init() {
        
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
