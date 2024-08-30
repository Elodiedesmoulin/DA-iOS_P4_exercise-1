import SwiftUI

final class ToDoListViewModel: ObservableObject {
    // MARK: - Private properties
    private let repository: ToDoListRepositoryType

    // MARK: - Init
    init(repository: ToDoListRepositoryType) {
        self.repository = repository
        self.allToDoItems = repository.loadToDoItems()
        self.filteredToDoItems = self.allToDoItems
    }

    // MARK: - Outputs

    /// Publisher for the list of all to-do items.
    @Published private var allToDoItems: [ToDoItem] = [] {
        didSet {
            repository.saveToDoItems(allToDoItems)
            applyFilter(at: filterIndex) // Re-apply the filter when the list changes
        }
    }

    /// Publisher for the list of filtered to-do items.
    @Published var filteredToDoItems: [ToDoItem] = []

    /// The currently selected filter index.
    @Published var filterIndex: Int = 0

    // MARK: - Inputs

    /// Add a new to-do item with priority and category.
    func add(item: ToDoItem) {
        allToDoItems.append(item)
    }

    /// Toggles the completion status of a to-do item.
    func toggleTodoItemCompletion(_ item: ToDoItem) {
        if let index = allToDoItems.firstIndex(where: { $0.id == item.id }) {
            allToDoItems[index].isDone.toggle()
        }
    }

    /// Removes a to-do item from the list.
    func removeTodoItem(_ item: ToDoItem) {
        allToDoItems.removeAll { $0.id == item.id }
    }

    /// Apply the filter to update the list.
    func applyFilter(at index: Int) {
        filterIndex = index
        switch index {
        case 1:
            // Show only done items
            filteredToDoItems = allToDoItems.filter { $0.isDone }
        case 2:
            // Show only not done items
            filteredToDoItems = allToDoItems.filter { !$0.isDone }
        default:
            // Show all items
            filteredToDoItems = allToDoItems
        }
    }
}
