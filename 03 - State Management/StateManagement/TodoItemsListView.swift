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
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    TodoItemRow(item: $todoItem.onNewValue {
                        viewModel.reorder()
                    })
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's tasks")
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
