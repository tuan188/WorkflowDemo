//
//  SettingsScreen.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 8/4/25.
//

import SwiftUI
import NavigatorUI

struct SettingsScreen: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        ManagedNavigationStack {
            Form {
                Button("Logout \(userName)")  {
                    isLoggedIn = false
                }
            }
        }
    }
}

