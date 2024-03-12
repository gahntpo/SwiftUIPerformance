//
//  ViewIdentiyProblemView.swift
//
//  Created by Karin Prater on 11.02.24.
//

import SwiftUI

struct ViewIdentityProblemView: View {
    @State private var fruits = Fruit.examples()
         
    var body: some View {
        HStack {
            ScrollView {
                Text("Fuits")
                    .font(.title2)
                
                ForEach($fruits, id: \.name) { $fruit in
                    TextField("Placeholder", text: $fruit.name)
                        .textFieldStyle(.roundedBorder)
                        
                }
                
                Button("Add new") {
                    fruits.append(Fruit(name: "new fruit"))
                }
            }
            
            /*
            Divider()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(fruits) { fruit in
                        SubView(text: fruit.name)
                    }
                }
            }
            .contentMargins(30)
             */
        }
        .padding()
    }
}

fileprivate struct SubView: View {
    
    var text: String
    @State private var isVisible: Bool = false
    
    var body: some View {
        let _ = Self._printChanges()
        Text(text)
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    isVisible.toggle()
                }
            }
    }
}

#Preview {
    ViewIdentityProblemView()
}
