//
//  ColorListView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import SwiftUI

// identifiers are not unique

struct ColorListView: View {
    
    @State private var colors = [Color.red, Color.blue, Color.green]
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Create a Linear Gradient")
                LinearGradient(colors: colors,
                               startPoint: .bottom,
                               endPoint: .topLeading)
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
                  ColorView(color: $color)
                }
            }
            .frame(width: 200)
        }
    }
}

struct ColorView: View {
    @Binding var color: Color
    var body: some View {
        let _ = Self._printChanges()
        HStack {
            ColorPicker("Color", selection: $color)
                .labelsHidden()
            Text("Color")
                .testAnimatedBackground()
        }
    }
}


#Preview {
    ColorListView()
}
