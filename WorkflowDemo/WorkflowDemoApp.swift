//
//  WorkflowDemoApp.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import SwiftUI

@main
struct WorkflowDemoApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State var error: Error?
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                HomeWorkflow {
                    print("Home workflow finished")
                } onFailure: { error in
                    print("Home workflow failed with error: \(error)")
                    self.error = error
                }
            } else {
                LoginWorkflow {
                    print("Login workflow finished")
                } onFailure: { error in
                    print("Login workflow failed with error: \(error)")
                    self.error = error
                }
            }
        }
    }
}
