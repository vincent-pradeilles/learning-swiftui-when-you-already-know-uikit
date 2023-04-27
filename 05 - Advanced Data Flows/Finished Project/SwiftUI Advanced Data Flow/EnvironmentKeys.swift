//
//  EnvironementKeys.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import Foundation
import SwiftUI

private struct AnalyticsEnvironmentKey: EnvironmentKey {
    static let defaultValue: Analytics = Analytics()
}

extension EnvironmentValues {
    var analytics: Analytics {
        get { self[AnalyticsEnvironmentKey.self] }
        set { self[AnalyticsEnvironmentKey.self] = newValue }
    }
}
