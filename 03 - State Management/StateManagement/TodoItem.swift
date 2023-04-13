//
//  TodoItem.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
