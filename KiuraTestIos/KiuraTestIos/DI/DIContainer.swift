//
//  DIContainer.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//


import SwiftUI

final class DIContainer: ObservableObject {
    static let shared = DIContainer()

    @Published var currentView: AppView = .taskList

    enum AppView {
        case taskList
        case addTask
    }

    private static let taskService = TaskService()
    private static let taskViewModel = TaskViewModel(taskService: taskService)

    static func resolveTaskViewModel() -> TaskViewModel {
        return taskViewModel
    }
}


