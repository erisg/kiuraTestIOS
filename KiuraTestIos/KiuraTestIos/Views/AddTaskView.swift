//
//  AddTaskView.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject private var diContainer = DIContainer.shared
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    @State private var selectedPriority: String = "medium"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    
                    Picker("Priority", selection: $selectedPriority) {
                        ForEach([TaskPriority.high, .medium, .low], id: \.self) { priority in
                            Text(priority.rawValue.capitalized).tag(priority)
                        }
                    }
                }

                Button(action: saveTask) {
                    Text("Save Task")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(title.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Add Task")
            .toolbar {
                Button("Cancel") {
                    diContainer.currentView = .taskList
                }
            }
        }
    }

    private func saveTask() {
        let viewModel = DIContainer.resolveTaskViewModel()
        viewModel.addTask(title: title, dueDate: dueDate, priority: selectedPriority)
        diContainer.currentView = .taskList
    }
}


#Preview {
    AddTaskView()
}
