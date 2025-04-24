//
//  LoginWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import Foundation
import SwiftUI
import NavigatorUI

struct LoginWorkflow {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("userName") var userName: String = ""
    
    var onFinish: (() -> Void)?
    var onFailure: ((Error) -> Void)?
}

extension LoginWorkflow: View {
    var body: some View {
        ManagedNavigationStack {
            LoginScreen { userName in
                onFinish?()
            } onLoginFailure: { error in
                onFailure?(error)
            }
            .navigationTitle("Login")
        }
    }
}
