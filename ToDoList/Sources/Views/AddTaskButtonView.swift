//
//  AddTaskButtonView.swift
//  ToDoList
//
//  Created by Elo on 15/09/2024.
//

import SwiftUI

struct AddTaskButtonView: View {
    @Binding var isAddingTodo: Bool

    var body: some View {
        Button(action: {
            isAddingTodo.toggle()
        }) {
            Text(isAddingTodo ? "Close" : "Add Task")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding()
    }
}


