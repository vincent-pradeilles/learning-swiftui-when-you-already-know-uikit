//
//  ChildView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import SwiftUI

struct ChildView: View {
    
    @State var text = ""
    
    var body: some View {
        Form {
            TextField("Write something", text: $text)
        }
        .textFieldInput(text)
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView()
    }
}
