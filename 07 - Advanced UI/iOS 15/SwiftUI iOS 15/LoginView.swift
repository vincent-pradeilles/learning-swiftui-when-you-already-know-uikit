//
//  LoginView.swift
//  SwiftUI iOS 15
//
//  Created by Vincent on 15/09/2021.
//

import SwiftUI

struct LoginView: View {
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var username = ""
    @State private var password = ""
    
    @FocusState private var focusedField: Field?

    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)
                .submitLabel(.next)

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
                .submitLabel(.continue)

            Button("Sign In") {

                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                } else {
                    print(username, password)
                }
            }
        }
        .onSubmit(of: .text) {
            if focusedField == .username {
                focusedField = .password
            } else {
                focusedField = nil
                print(username, password)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
