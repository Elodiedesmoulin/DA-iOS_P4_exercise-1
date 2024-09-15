//
//  Status.swift
//  ToDoList
//
//  Created by Elo on 10/09/2024.
//

import SwiftUI

enum Status: String, CaseIterable {
    case all = "All"
    case done = "Done"
    case notDone = "Not Done"

    /// Returns the appropriate filter closure based on the status.
    func filter(_ items: [ToDoItem]) -> [ToDoItem] {
        switch self {
        case .done:
            return items.filter { $0.isDone }
        case .notDone:
            return items.filter { !$0.isDone }
        default:
            return items
        }
    }
}

