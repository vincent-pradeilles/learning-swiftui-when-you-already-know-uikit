//
//  ParentView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import SwiftUI

struct ParentView: View {
    
    @State var textInput = ""
    
    var body: some View {
        VStack {
            Text("This what my child asked me to say: \(textInput)")
            
            HStack {
                ChildView()
            }
        }
        .onPreferenceChange(TextFieldInputPreferenceKey.self) { newValue in
            textInput = newValue
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
