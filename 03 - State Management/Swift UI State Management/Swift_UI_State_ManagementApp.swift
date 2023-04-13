//
//  Swift_UI_State_ManagementApp.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import SwiftUI

@main
struct Swift_UI_State_ManagementApp: App {
        
    var todoItems: [TodoItem] = try! .fromJSON(named: "TodoItems")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
