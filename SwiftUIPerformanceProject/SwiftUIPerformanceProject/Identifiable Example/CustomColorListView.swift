//
//  CustomColorListView.swift
//  PerformanceTestingProject
//
//  Created by Karin Prater on 19.02.24.
//

import SwiftUI

struct CustomColorListView: View {
    
    @State private var colorData = [ColorData(color: .red), ColorData(color: .blue), ColorData(color: .green)]
    
    var colors: [Color] {
        colorData.map({ $0.color })
    }
    
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
                    colorData.append(ColorData(color: .red))
                }, label: {
                    Label("Add New Color", systemImage: "plus")
                })
                
                ForEach($colorData) { $data in
                    ColorPicker("Color", selection: $data.color)
                        .labelsHidden()
                }
            }
            .frame(width: 200)
        }
    }
}

#Preview {
    CustomColorListView()
}
