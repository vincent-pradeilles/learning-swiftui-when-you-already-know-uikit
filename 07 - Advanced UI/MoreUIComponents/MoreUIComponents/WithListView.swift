//
//  WithListView.swift
//  MoreUIComponents
//
//  Created by Vincent on 11/05/2023.
//

import SwiftUI

struct WithListView: View {
    var body: some View {
        List {
            ForEach(0..<10_000) { i in
                HStack {
                    let _ = print("List Item \(i)")
                    Text("Item \(i)")
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct WithListView_Previews: PreviewProvider {
    static var previews: some View {
        WithListView()
    }
}
