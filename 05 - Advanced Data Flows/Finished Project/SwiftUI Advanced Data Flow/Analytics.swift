//
//  Analytics.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import Foundation

class Analytics {    
    func send(tag: String) {
        print("Tag \(tag) was sent")
    }
}

class MockAnalytics: Analytics {
    override func send(tag: String) {
        print("Overriden method")
    }
}
