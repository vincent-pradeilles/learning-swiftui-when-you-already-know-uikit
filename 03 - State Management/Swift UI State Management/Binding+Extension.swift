//
//  Binding+Extension.swift
//  Swift UI State Management
//
//  Created by Vincent on 23/11/2021.
//

import SwiftUI

extension Binding {
    func whenEmpty<Wrapped>(_ defaultValue: Wrapped) -> Binding<Wrapped> where Value == Wrapped? {
        .init(
            get: { wrappedValue ?? defaultValue },
            set: { wrappedValue = $0 }
        )
    }
    
    func onNewValue(_ code: @escaping () -> Void) -> Binding<Value> {
        .init(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                code()
            }
        )
    }
}
