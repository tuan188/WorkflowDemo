//
//  PageScreen.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 14/4/25.
//

import SwiftUI

struct PageScreen: View {
    let pageName: String
    
    var onGoForward: (() -> Void)?
    var onGoBack: (() -> Void)?
    
    var body: some View {
        VStack {
            Text("This is \(pageName)")
                .font(.title)
                .padding()
            
            HStack {
                Button("Go Back") {
                    onGoBack?()
                }
                .padding()
                
                Button("Go Forward") {
                    onGoForward?()
                }
                .padding()
            }
        }
    }
}
