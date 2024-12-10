//
//  TaskListView.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel: TaskViewModel
    @ObservedObject private var diContainer = DIContainer.shared

    init(viewModel: TaskViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.tasks) { task in
                    TaskRow(
                        task: task,
                        onComplete: {
                            print("uodate \(task.id)")
                            viewModel.markTaskCompleted(id: task.id)
                        },
                        onDelete: {
                            print("delete \(task.id)")
                            viewModel.deleteTask(id: task.id)
                        }
                    )
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button(action: {
                    diContainer.currentView = .addTask
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}



