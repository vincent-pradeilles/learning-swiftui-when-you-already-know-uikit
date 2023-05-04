//
//  ContentView.swift
//  UIKit_in_SwiftUI
//
//  Created by Vincent on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.apple.com")!)
            .set(navigationPolicy: { navigationAction in
                navigationAction.navigationType == .linkActivated ? .cancel : .allow
            })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
