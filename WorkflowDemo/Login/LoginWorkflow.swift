//
//  LoginWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import Foundation
import SwiftUI
import NavigatorUI

struct LoginWorkflow: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("userName") var userName: String = ""
    
    var onFinish: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    var body: some View {
        ManagedNavigationStack {
            LoginScreen { userName in
                self.userName = userName
                self.finish()
            } onLoginFailure: { error in
                onFailure?(error)
            }
            .navigationTitle("Login")
        }
    }
    
    func finish() {
        isLoggedIn = true
        print("Login workflow finished")
        onFinish?()
    }
}
