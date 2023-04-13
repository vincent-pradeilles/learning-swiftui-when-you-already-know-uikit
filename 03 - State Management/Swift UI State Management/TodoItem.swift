//
//  TodoItem.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import Foundation

struct TodoItem: Codable, Equatable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
