//
//  Socks.swift
//  ViewIdentityProject
//
//  Created by Karin Prater on 21.02.24.
//

import Foundation
// how to model your data for optimal performance -> identity

struct Socks: Identifiable {
    let id: UUID = UUID() // bar code reader // Monday, Tuesday ...
    var daysWorn: Int
    var imageName: String  // would not be a good identifier
    var isFavorite: Bool = false
}

