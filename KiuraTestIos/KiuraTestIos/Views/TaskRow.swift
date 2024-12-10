//
//  TaskRow.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    let onComplete: () -> Void
    let onDelete: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted, color: .gray)

                Text(task.dueDate, style: .date)
                    .font(.subheadline)
                    .foregroundColor(task.dueDate < Date() ? .red : .gray)
            }

            Spacer()
            Button(action: {
                onComplete()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .blue)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer(minLength: 16)  // Añadimos un espacio mínimo entre los botones

            // Botón para eliminar la tarea
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle()) // Añadimos esto también
        }
        .padding()
        .background(task.dueDate < Date() ? Color.red.opacity(0.1) : Color.clear)
        .cornerRadius(10)
    }
}
