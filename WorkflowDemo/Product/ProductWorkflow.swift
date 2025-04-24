//
//  ProductWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import Foundation
import SwiftUI
import NavigatorUI

struct ProductWorkflow {
    var onFinish: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    @State var currentScreen = Destinations.listProduct
    
    func navigate(to destination: Destinations) {
        currentScreen = destination
    }
}

// MARK: - Navigation
extension ProductWorkflow {
    enum Destinations: NavigationDestination {
        case listProduct
        case productDetail(Product)
        case editProduct(Product)
        
        var body: some View {
            DestinationsView(destination: self)
        }
        
        var method: NavigationMethod {
            switch self {
            case .listProduct:
                return .cover
            case .productDetail:
                return .push
            case .editProduct:
                return .sheet
            }
        }
    }
    
    private struct DestinationsView: View {
        @Environment(\.navigator) var navigator: Navigator
        
        let destination: Destinations
        
        var body: some View {
            switch destination {
            case .listProduct:
                ListProductScreen { product in
                    navigator.navigate(to: Destinations.productDetail(product))
                } onEdit: { product in
                    navigator.navigate(to: Destinations.editProduct(product))
                }
            case .productDetail(let product):
                ProductDetailScreen(product: product)
            case .editProduct(let product):
                EditProductScreen(product: product) { product in
                    
                }
            }
        }
    }
}

// MARK: - View
extension ProductWorkflow: View {
    var body: some View {
        ManagedNavigationStack {
            currentScreen
                .navigationTitle("Products")
                .navigationDestination(Destinations.self)
                .onNavigationReceive { (destination: Destinations, navigator) in
                    navigator.navigate(to: destination)
                    return .auto
                }
        }
    }
}


