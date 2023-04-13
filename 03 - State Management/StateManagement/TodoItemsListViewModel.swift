//
//  ContentViewModel.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import Foundation

class TodoItemsListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = []
    
    func loadItems() {
        guard todoItems.isEmpty else { return }
        
        do {
            self.todoItems = try .fromJSON(named: "TodoItems")
        } catch {
            fatalError("\(error)")
        }
    }
    
    func reorder() {
        todoItems.sort(by: { !$0.isDone && $1.isDone })
    }
    
    func deleteItems(at indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItems(from indexSet: IndexSet, to newIndex: Int) {
        todoItems.move(fromOffsets: indexSet, toOffset: newIndex)
    }
}
