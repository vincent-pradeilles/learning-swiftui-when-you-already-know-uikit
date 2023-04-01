//
//  ContentView.swift
//  DiscoringSwiftUI
//
//  Created by Vincent on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var userName: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("hello.title")
                .foregroundColor(.red)
                .multilineTextAlignment(.leading)
            
            Text("Current time is:")
            Text(Date(), style: .time)
                .redacted(reason: .placeholder)
            
            TextField("What's your name?", text: $userName)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.words)

            TextEditor(text: $userName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
