//
//  WithLazyVStack.swift
//  MoreUIComponents
//
//  Created by Vincent on 11/05/2023.
//

import SwiftUI

struct WithLazyVStack: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10_000) { i in
                    HStack {
                        let _ = print("VStack Item \(i)")
                        Text("Item \(i)")
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

struct WithLazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        WithLazyVStack()
    }
}
