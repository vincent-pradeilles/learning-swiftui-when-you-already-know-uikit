//
//  SwiftUI_Advanced_Data_FlowApp.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 04/09/2021.
//

import SwiftUI

@main
struct SwiftUI_Advanced_Data_FlowApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView {
                FirstFeatureView()
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                        Text("One")
                    }
                SecondFeatureView()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                        Text("Two")
                    }
                ThirdFeatureView()
                    .tabItem {
                        Image(systemName: "3.circle.fill")
                        Text("Three")
                    }
            }
        }
    }
}
