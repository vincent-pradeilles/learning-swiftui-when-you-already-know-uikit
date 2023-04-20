//
//  TodoItemRow.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        HStack {
            TodoToggleButton(state: $item.isDone)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                
                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding()
    }
}

struct TodoItemRow_Previews: PreviewProvider {
    
    static let todoItemWithoutDescription = TodoItem(
        id: UUID(),
        title: "Buy some bread 🥖"
    )
    
    static let todoItemWithDescription = TodoItem(
        id: UUID(),
        title: "Buy some milk 🥛",
        description: "Get a lactose free one"
    )
    
    static var previews: some View {
        Group {
            TodoItemRow(item: .constant(todoItemWithoutDescription))
                .previewDisplayName("Without Description")
            
            StatefulPreviewWrapper(todoItemWithDescription) { todoItem in
                TodoItemRow(item: todoItem)
            }
            .previewDisplayName("With Description")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
