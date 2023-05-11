//
//  ContentView.swift
//  MoreUIComponents
//
//  Created by Vincent on 11/05/2023.
//

import SwiftUI

struct WithVStackView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10_000) { i in
                    HStack {
                        let _ = print("LazyVStack Item \(i)")
                        Text("Item \(i)")
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}


struct WithVStackView_Previews: PreviewProvider {
    static var previews: some View {
        WithVStackView()
    }
}
