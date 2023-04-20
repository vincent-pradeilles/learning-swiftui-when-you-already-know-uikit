//
//  AboutView.swift
//  StateManagement
//
//  Created by Vincent on 20/04/2023.
//

import SwiftUI

struct AboutView: View {
    
    @State var isMoreInfoPresented = false
    
    var body: some View {
        VStack {
            Text("This app was made during\na SwiftUI course 👨‍🎓🧑‍🎓")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("More info?") {
                isMoreInfoPresented = true
            }
        }
        .sheet(isPresented: $isMoreInfoPresented) {
            MoreInfoView()
                .presentationDetents([.fraction(0.25), .medium, .large])
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
