//
//  KiuraTestIosApp.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import SwiftUI

@main
struct KiuraTestIosApp: App {
    @StateObject private var diContainer = DIContainer.shared
    var body: some Scene {
        WindowGroup {
                    switch diContainer.currentView {
                    case .taskList:
                        TaskListView(viewModel: DIContainer.resolveTaskViewModel())
                    case .addTask:
                        AddTaskView()
                    }
                }
    }
}
