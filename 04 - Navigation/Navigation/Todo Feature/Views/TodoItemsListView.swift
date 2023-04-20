//
//  ContentView.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import SwiftUI

struct TodoItemsListView: View {
    
    @StateObject var viewModel = TodoItemsListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    NavigationLink(value: todoItem) {
                        TodoItemRow(item: $todoItem.onNewValue {
                            viewModel.reorder()
                        })
                    }

//                    NavigationLink {
//                        TodoItemDetailView(item: $todoItem)
//                    } label: {
//                        TodoItemRow(item: $todoItem.onNewValue {
//                            viewModel.reorder()
//                        })
//                    }
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's tasks")
            .navigationDestination(for: TodoItem.self, destination: { todoItem in
                let todoItemBinding = Binding(
                    get: {
                        viewModel.todoItems.first(where: { $0.id == todoItem.id })!
                    },
                    set: { newItem in
                        let index = viewModel.todoItems.firstIndex(where: { $0.id == todoItem.id })!
                        viewModel.todoItems[index] = newItem
                    }
                )
                TodoItemDetailView(item: todoItemBinding)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsListView()
    }
}
