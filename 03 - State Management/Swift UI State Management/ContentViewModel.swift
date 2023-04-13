//
//  ContentViewModel.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var items: [TodoItem] = []
    
    func loadItems() {
        do {
            self.items = try .fromJSON(named: "TodoItems")
        } catch {
            fatalError("\(error)")
        }
    }
    
    func reorder() {
        items.sort(by: { !$0.isDone && $1.isDone })
    }
    
    func deleteItems(at indexSet: IndexSet) {
        self.items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from indices: IndexSet, to newIndex: Int) {
        self.items.move(fromOffsets: indices, toOffset: newIndex)
    }
}
