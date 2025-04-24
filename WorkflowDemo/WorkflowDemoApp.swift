//
//  WorkflowDemoApp.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import SwiftUI
import NavigatorUI

@main
struct WorkflowDemoApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("finishOnboarding") var finishOnboarding: Bool = false
    @State var error: Error?
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                if finishOnboarding {
                    HomeWorkflow {
                        print("Home workflow finished")
                    } onFailure: { error in
                        print("Home workflow failed with error: \(error)")
                        self.error = error
                    }
                } else {
                    OnboardingWorkflow()
                }
            } else {
                LoginWorkflow {
                    print("Login workflow finished")
                    isLoggedIn = true
                } onFailure: { error in
                    print("Login workflow failed with error: \(error)")
                    self.error = error
                }
            }
        }
    }
}

//
//extension WorkflowDemoApp {
//    enum Destinations: NavigationDestination {
//        case login
//        case onboarding
//        case home
//        
//        var body: some View {
//            DestinationsView(destination: self)
//        }
//    }
//    
//    private struct DestinationsView: View {
//        let destination: Destinations
//        
//        var body: some View {
//            switch destination {
//            case .login:
//                LoginWorkflow()
//            case .onboarding:
//                OnboardingWorkflow()
//            case .home:
//                HomeWorkflow()
//            }
//        }
//    }
//}
