//
//  HomeWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 8/4/25.
//

import Foundation
import SwiftUI

struct HomeWorkflow: View {
    
    var onFinish: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    var body: some View {
        TabView {
            // Tab item with product icon
            ProductWorkflow()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Products")
                }
            
            SettingsWorkflow()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}
