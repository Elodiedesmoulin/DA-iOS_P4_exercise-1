import SwiftUI

struct ToDoListView: View {
    @ObservedObject var viewModel: ToDoListViewModel
    @State private var newTodoTitle = ""
    @State private var isShowingAlert = false
    @State private var isAddingTodo = false
    @State private var filterIndex: Status = .all
    
    var body: some View {
        NavigationView {
            VStack {
                FilterView(filterIndex: $filterIndex)
                    .onChange(of: filterIndex) { status in
                        viewModel.filterIndex = status
                        viewModel.applyFilter()
                    }
                
                // List of tasks
                List {
                    ForEach(viewModel.filteredToDoItems) { item in
                        TodoItemView(item: item, toggleCompletion: {
                            viewModel.toggleTodoItemCompletion(item)
                        })
                    }
                    .onDelete { indices in
                        indices.map { viewModel.filteredToDoItems[$0] }.forEach(viewModel.removeTodoItem)
                    }
                }
                
                if isAddingTodo {
                    AddTodoView(newTodoTitle: $newTodoTitle, isShowingAlert: $isShowingAlert, addAction: {
                        if !newTodoTitle.isEmpty {
                            viewModel.add(item: .init(title: newTodoTitle))
                            newTodoTitle = ""
                            isAddingTodo = false
                        } else {
                            isShowingAlert = true
                        }
                    })
                }
                
                AddTaskButtonView(isAddingTodo: $isAddingTodo)
            }
            .navigationBarTitle("To-Do List")
            .navigationBarItems(trailing: EditButton())
        }
    }
}




struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(
            viewModel: ToDoListViewModel(
                repository: ToDoListRepository()
            )
        )
    }
}


