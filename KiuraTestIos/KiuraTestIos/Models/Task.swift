//
//  Task.swift
//  KiuraTestIos
//
//  Created by geraldin archila on 10/12/24.
//

import Foundation

enum TaskPriority: String, Codable {
    case low, medium, high

    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "low":
            self = .low
        case "medium":
            self = .medium
        case "high":
            self = .high
        default:
            return nil
        }
    }
}

struct Task: Identifiable, Decodable {
    let id: UUID
    var title: String
    var dueDate: Date
    var priority: String
    var isCompleted: Bool
}

