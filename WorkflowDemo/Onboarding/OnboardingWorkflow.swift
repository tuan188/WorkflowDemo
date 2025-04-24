//
//  OnboardingWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 14/4/25.
//

import SwiftUI
import NavigatorUI

struct OnboardingWorkflow {
    var onFinish: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    @State var currentScreen = Destinations.page1
    
    func navigate(to destination: Destinations) {
        currentScreen = destination
    }
}

extension OnboardingWorkflow {
    enum Destinations: NavigationDestination {
        case page1
        case page2
        case page3
        
        var title: String {
            switch self {
            case .page1:
                return "Page 1"
            case .page2:
                return "Page 2"
            case .page3:
                return "Page 3"
            }
        }
        
        var body: some View {
            DestinationsView(destination: self)
        }
    }
    
    private struct DestinationsView: View {
        @Environment(\.navigator) var navigator: Navigator
        @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
        @AppStorage("finishOnboarding") var finishOnboarding: Bool = false
        
        let destination: Destinations
        
        var body: some View {
            switch destination {
            case .page1:
                PageScreen(pageName: destination.title) {
                    navigator.navigate(to: Destinations.page2)
                } onGoBack: {
                    navigator.navigate(to: Destinations.page3)
                }
            case .page2:
                PageScreen(pageName: destination.title) {
                    navigator.navigate(to: Destinations.page3)
                } onGoBack: {
                    navigator.navigate(to: Destinations.page1)
                }
            case .page3:
                PageScreen(pageName: destination.title) {
                    finishOnboarding = true
                } onGoBack: {
                    navigator.navigate(to: Destinations.page2)
                }
            }
        }
    }
}

extension OnboardingWorkflow: View {
    var body: some View {
        ManagedNavigationStack {
            currentScreen
                .navigationDestination(Destinations.self)
                .onNavigationReceive { (destination: Destinations, navigator) in
                    navigator.navigate(to: destination)
                    return .auto
                }
        }
    }
}
