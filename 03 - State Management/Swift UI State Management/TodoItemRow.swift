//
//  TodoItemRow.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItem
    
    var body: some View {
        HStack {
            TodoToggleButton(state: $item.isDone)
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
        .frame(height: 70)
    }
}

struct TodoItemRow_Previews: PreviewProvider {
    static var todoItemWithoutDescription = TodoItem(id: UUID(),
                                                     title: "Acheter du pain 🥖")
    static var todoItemWithDescription = TodoItem(id: UUID(),
                                                  title: "Acheter du lait 🥛",
                                                  description: "Prendre du demi-écrémé")
    
    static var previews: some View {
        Group {
            TodoItemRow(item: .constant(todoItemWithoutDescription))
                .previewLayout(.fixed(width: 300.0, height: 70.0))
            TodoItemRow(item: .constant(todoItemWithDescription))
                .previewLayout(.fixed(width: 300.0, height: 70.0))
        }
    }
}
