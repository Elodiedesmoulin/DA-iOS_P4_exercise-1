//
//  ToDoItemView.swift
//  ToDoList
//
//  Created by Elo on 15/09/2024.
//

import SwiftUI

struct TodoItemView: View {
    let item: ToDoItem
    let toggleCompletion: () -> Void

    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(item.isDone ? .green : .primary)
            }
            Text(item.title)
                .font(item.isDone ? .subheadline : .body)
                .strikethrough(item.isDone)
                .foregroundColor(item.isDone ? .gray : .primary)
        }
    }
}

