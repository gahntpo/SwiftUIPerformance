//
//  ColorPickerButton.swift
//  ViewIdentityProject
//
//  Created by Karin Prater on 28.02.24.
//

import SwiftUI

struct FruitPopoverView: View {
    
    @State private var fruits = Fruit.examples()
   
    var body: some View {
        List {
            Text("Fruits")
                .font(.title2)
            /*
            ForEach($fruits) { $fruit in
                FruitRow(fruit: $fruit)
            }
             */
        }
    }
}

fileprivate struct FruitRow: View {
    
    @Binding var fruit: Fruit
    @State private var selectedFruit: Fruit? = nil
   // @State private var popoverIsShown: Bool = true
    
    var body: some View {
        Button(fruit.name) {
            selectedFruit = fruit
        }
        /*
        .popover(item: $selectedFruit) { fruit in
            Button("Change \(fruit.name)") {
               // self.fruit.id = UUID()
            }
            .padding()
            .presentationCompactAdaptation(.popover)
        }
        */
    }
}



#Preview {
    FruitPopoverView()
}
