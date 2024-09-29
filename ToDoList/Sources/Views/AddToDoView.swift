//
//  AddToDoView.swift
//  ToDoList
//
//  Created by Elo on 15/09/2024.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var newTodoTitle: String
    @Binding var isShowingAlert: Bool
    let addAction: () -> Void
    
    var body: some View {
        HStack {
            TextField("Enter Task Title", text: $newTodoTitle)
                .padding(.leading)
            
            Spacer()
            
            Button(action: addAction) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}


