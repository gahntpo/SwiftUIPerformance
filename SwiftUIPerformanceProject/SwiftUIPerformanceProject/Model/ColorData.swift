//
//  ColorData.swift
//  SwiftUIPerformanceProject
//
//  Created by Karin Prater on 21.02.24.
//

import SwiftUI

@Observable class ColorData: Identifiable {
    var color: Color
    let id = UUID()
    init(color: Color) {
        self.color = color
    }
}
