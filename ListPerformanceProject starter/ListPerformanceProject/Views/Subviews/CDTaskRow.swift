//
//  CDTaskRow.swift
//  ListPerformanceProject
//
//  Created by Karin Prater on 04.03.24.
//

import SwiftUI

struct CDTaskRow: View {
    let task: CDTask
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: task.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundColor(task.isDone ? .green : .gray)
            VStack(alignment: .leading) {
                Text(task.title)
                Text(task.creationDate.formatted(date: .complete, time: .standard))
                    .font(.caption)
            }
        }
    }
}

#Preview {
    CDTaskRow(task: CDTask.example())
}
