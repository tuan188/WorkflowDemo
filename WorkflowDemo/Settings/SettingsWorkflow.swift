//
//  SettingsWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 8/4/25.
//

import Foundation
import SwiftUI
import NavigatorUI

struct SettingsWorkflow: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        ManagedNavigationStack {
            SettingsScreen()
                .navigationTitle("Settings")
        }
    }
}
