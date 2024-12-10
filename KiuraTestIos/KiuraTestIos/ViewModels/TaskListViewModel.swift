//
//  TaskListViewModel.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published private(set) var tasks: [Task] = []
    @Published var searchQuery: String = ""
    @Published var selectedPriorityFilter: TaskPriority? = nil

    private let taskService: TaskServiceProtocol

    init(taskService: TaskServiceProtocol) {
        self.taskService = taskService
        fetchTasks()
    }

    func fetchTasks() {
        tasks = taskService.fetchTasks()
    }

    func addTask(title: String, dueDate: Date, priority: String) {
        let newTask = Task(id: UUID(), title: title, dueDate: dueDate, priority: priority, isCompleted: false)
        taskService.addTask(newTask)
        fetchTasks()
    }

    func deleteTask(id: UUID) {
        taskService.deleteTask(with: id)
        fetchTasks()
    }

    func markTaskCompleted(id: UUID) {
        if let task = tasks.first(where: { $0.id == id }) {
            var updatedTask = task
            updatedTask.isCompleted.toggle()
            taskService.updateTask(updatedTask)
            fetchTasks()        }
    }
}

