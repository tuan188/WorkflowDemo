//
//  LoginScreen.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import SwiftUI

struct LoginScreen: View {
    var onLoginSuccess: (String) -> Void
    var onLoginFailure: (Error) -> Void
    
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var isUsernameFocused: Bool
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                    .textContentType(.username)
                    .autocapitalization(.none)
                    .focused($isUsernameFocused)
                
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .autocapitalization(.none)
            }
            
            Button("Login") {
                // Simulate login success
                print("Login successful")
                onLoginSuccess(username)
            }
            .disabled(username.isEmpty || password.isEmpty)
        }
        .onAppear {
            isUsernameFocused = true
        }
    }
}
