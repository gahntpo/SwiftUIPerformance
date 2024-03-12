//
//  NoteListSortingPickerView.swift
//  SlipboxProject
//
//  Created by Karin Prater on 05.01.23.
//

import SwiftUI

struct NoteListSortingPickerView: View {
    
    @Binding var sorting: TaskSorting
    
    var body: some View {
        Picker("Sort by", selection: $sorting.animation()) {
            ForEach(TaskSorting.allCases) { sorting in
                Text(sorting.title())
            }
        }
        .accessibilityIdentifier("Sort_Button")
        #if DEBUG
        .pickerStyle(SegmentedPickerStyle())
        #endif
    }
}

struct NoteListSortingPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListSortingPickerView(sorting: .constant(.creationDateAsc))
    }
}
