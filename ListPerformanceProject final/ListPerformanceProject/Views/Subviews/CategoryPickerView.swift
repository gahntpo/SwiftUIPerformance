//
//  CategoryPickerView.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 05.03.24.
//

import SwiftUI

struct CategoryPickerView: View {
    @Binding var selectedCategory: Category
    
    var body: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(Category.allCases, id: \.self) { category in
                Text(category.rawValue).tag(category)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
}

#Preview {
    CategoryPickerView(selectedCategory: .constant(.personal))
}
