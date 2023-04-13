//
//  Binding+Extension.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import SwiftUI

extension Binding {
    func onNewValue(_ sideEffect: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                sideEffect()
            }
        )
    }
}
