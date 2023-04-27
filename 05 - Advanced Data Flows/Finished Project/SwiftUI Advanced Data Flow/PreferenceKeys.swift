//
//  PreferenceKeys.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import Foundation
import SwiftUI

struct MaxWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct TextFieldInputPreferenceKey: PreferenceKey {
    static let defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func textFieldInput(_ textInput: String) -> some View {
        self.preference(key: TextFieldInputPreferenceKey.self, value: textInput)
    }
}
