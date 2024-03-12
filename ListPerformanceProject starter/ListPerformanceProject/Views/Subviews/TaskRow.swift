//
//  TaskRow.swift
//  IOSTestProject
//
//  Created by Karin Prater on 03.03.24.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
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
    TaskRow(task: Task.example())
}
