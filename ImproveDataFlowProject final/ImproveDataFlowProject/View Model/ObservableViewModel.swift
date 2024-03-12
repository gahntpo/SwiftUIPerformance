//
//  ObservableViewModel.swift
//  ImproveDataFlowProject
//
//  Created by Karin Prater on 28.02.24.
//

import Foundation
import Observation
import Combine

@Observable
class ObservableViewModel {
    
    var inspirations = ObservableNatureInspiration.examples()
    var timeRemaining: Date = Date()
    
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
