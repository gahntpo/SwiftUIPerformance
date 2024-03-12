//
//  NoteSorting.swift
//  SlipboxProject
//
//  Created by Karin Prater on 15.12.22.
//

import Foundation

enum TaskSorting: CaseIterable, Identifiable {
    
    case titleAsc
    case titleDes
    case creationDateAsc
    case creationDateDes
    
    var id: Self { self }
    
    func title() -> String {
        switch self {
            case .titleAsc:
                return "Title △"
            case .titleDes:
                return "Title ▽"
            case .creationDateAsc:
                return "Date △"
            case .creationDateDes:
                return "Date ▽"
        }
    }
}
