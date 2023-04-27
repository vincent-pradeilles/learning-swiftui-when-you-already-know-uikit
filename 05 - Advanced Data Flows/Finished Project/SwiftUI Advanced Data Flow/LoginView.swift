//
//  LoginView.swift
//  SwiftUI Advanced Data Flow
//
//  Created by Vincent on 27/04/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        SyncingView { proxy in
            Group {
                Button("M'inscrire") { }
                Button("Me connecter") { }
            }
            .syncWidth(using: proxy)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.headline)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
