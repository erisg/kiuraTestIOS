//
//  TaskServiceProtocol.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import Foundation
import CoreData
protocol TaskServiceProtocol {
    func fetchTasks() -> [Task]
    func addTask(_ task: Task)
    func deleteTask(with id: UUID)
    func updateTask(_ task: Task)
}

final class TaskService: TaskServiceProtocol {
    private let context = CoreDataStack.shared.context

    func fetchTasks() -> [Task] {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        do {
            let taskEntities = try context.fetch(request)
            return taskEntities.map { taskEntity in
                Task(
                    id: taskEntity.id!,
                    title: taskEntity.title!,
                    dueDate: taskEntity.dueDate ?? Date(),
                    priority: taskEntity.priority ?? "default value",
                    isCompleted: taskEntity.isCompleted
                )
            }
        } catch {
            print("Error fetching tasks: \(error)")
            return []
        }
    }

    func addTask(_ task: Task) {
        let taskEntity = TaskEntity(context: context)
        taskEntity.id = task.id
        taskEntity.title = task.title
        taskEntity.dueDate = task.dueDate
        taskEntity.priority = task.priority
        taskEntity.isCompleted = task.isCompleted
        saveContext()
    }

    func deleteTask(with id: UUID) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        if let taskEntity = try? context.fetch(request).first {
            context.delete(taskEntity)
            saveContext()
        }
    }

    func updateTask(_ task: Task) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
        if let taskEntity = try? context.fetch(request).first {
            taskEntity.title = task.title
            taskEntity.dueDate = task.dueDate
            taskEntity.priority = task.priority
            taskEntity.isCompleted = task.isCompleted
            saveContext()
        }
    }

    private func saveContext() {
        CoreDataStack.shared.saveContext()
    }
}
