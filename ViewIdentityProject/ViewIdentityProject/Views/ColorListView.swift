//
//  ColorListView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import SwiftUI

struct ColorListView: View {
    @State private var colors = [Color.red, 
                                 Color.blue,
                                 Color.green]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Create a Linear Gradient")
                LinearGradient(colors: colors,
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .aspectRatio(1, contentMode: .fit)
            }
            .padding()
            
            List {
                Button(action: {
                    colors.append(.red)
                }, label: {
                    Label("Add New Color", systemImage: "plus")
                })
                
                ForEach($colors, id: \.self) { $color in
                    ColorPicker("Color", selection: $color)
                }
            }
            
        }
    }
}

#Preview {
    ColorListView()
}
