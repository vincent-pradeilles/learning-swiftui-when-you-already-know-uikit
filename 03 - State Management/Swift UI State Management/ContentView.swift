//
//  ContentView.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach($viewModel.items) { $item in
                    TodoItemRow(item: $item.onNewValue {
                        viewModel.reorder()
                    })
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.grouped)
            .navigationBarTitle(Text("Today's tasks"))
            .navigationBarItems(trailing: EditButton())
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
