import XCTest
import Combine
@testable import ToDoList

final class ToDoListViewModelTests: XCTestCase {
    // MARK: - Properties
    
    private var viewModel: ToDoListViewModel!
    private var repository: MockToDoListRepository!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        repository = MockToDoListRepository()
        viewModel = ToDoListViewModel(repository: repository)
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        viewModel = nil
        repository = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testAddTodoItem() {
        // Given
        let item = ToDoItem(title: "Test Task")
        XCTAssertTrue(viewModel.filteredToDoItems.isEmpty)
        // When
        viewModel.add(item: item)
        
        // Then
        XCTAssertEqual(viewModel.filteredToDoItems.count, 1)
        XCTAssertTrue(viewModel.filteredToDoItems[0].title == "Test Task")
    }
    
    func testToggleTodoItemCompletion() {
        // Given
        let item = ToDoItem(title: "Test Task")
        viewModel.add(item: item)
        XCTAssertFalse(viewModel.filteredToDoItems[0].isDone)
        // When
        viewModel.toggleTodoItemCompletion(item)
        
        // Then
        XCTAssertTrue(viewModel.filteredToDoItems[0].isDone)
    }
    
    func testRemoveTodoItem() {
        // Given
        let item = ToDoItem(title: "Test Task")
        viewModel.add(item: item)
        
        XCTAssertEqual(viewModel.filteredToDoItems, [item])
        // When
        viewModel.removeTodoItem(item)
        
        // Then
        XCTAssertTrue(viewModel.filteredToDoItems.isEmpty)
    }
    
    func testFilteredToDoItems() {
           // Given
           let item1 = ToDoItem(title: "Task 1", isDone: true)
           let item2 = ToDoItem(title: "Task 2", isDone: false)
           viewModel.add(item: item1)
           viewModel.add(item: item2)
           
           // When
           viewModel.filterIndex = .all
           viewModel.applyFilter()
           // Then
           XCTAssertEqual(viewModel.filteredToDoItems, [item1, item2])
           
           // When
           viewModel.filterIndex = .done
           viewModel.applyFilter()
           // Then
           XCTAssertEqual(viewModel.filteredToDoItems, [item1])
           
           // When
           viewModel.filterIndex = .notDone
           viewModel.applyFilter()
           // Then
           XCTAssertEqual(viewModel.filteredToDoItems, [item2])
       }
   }
