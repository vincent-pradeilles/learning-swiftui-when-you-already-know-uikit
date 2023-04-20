//
//  TodoItemDetailView.swift
//  StateManagement
//
//  Created by Vincent on 20/04/2023.
//

import SwiftUI

struct TodoItemDetailView: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        Form {
            TextField("Title", text: $item.title)
                .font(.headline)
            TextField("Description", text: $item.description.whenEmpty(""))
                .font(.subheadline)
        }
        .navigationTitle("Edit")
    }
}

struct TodoItemDetailView_Previews: PreviewProvider {
    
    static let todoItem = TodoItem(
        id: UUID(),
        title: "Buy some bread 🥖"
    )
    
    static var previews: some View {
        StatefulPreviewWrapper(todoItem) { todoItem in
            TodoItemDetailView(item: todoItem)
        }
    }
}
