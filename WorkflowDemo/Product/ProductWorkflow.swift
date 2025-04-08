//
//  ProductWorkflow.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import Foundation
import SwiftUI
import NavigatorUI

struct ProductWorkflow: View {
    @Environment(\.navigator) var navigator: Navigator
    
    var onFinish: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    var body: some View {
        ManagedNavigationStack {
            ListProductScreen { product in
                print("Product selected: \(product.name)")
                showProductDetail(product: product)
            } onEdit: { product in
                print("Edit product: \(product.name)")
                showEditProduct(product: product)
            }
            .navigationTitle("Products")
            .navigationDestination(ProductDestinations.self)
            .onNavigationReceive { (destination: ProductDestinations, navigator) in
                navigator.navigate(to: destination)
                return .auto
            }
        }
    }
    
    func showProductDetail(product: Product) {
        navigator.send(ProductDestinations.productDetail(product))
    }
    
    func showEditProduct(product: Product) {
        navigator.send(ProductDestinations.editProduct(product))
    }
}

enum ProductDestinations {
    case productDetail(Product)
    case editProduct(Product)
}

extension ProductDestinations: NavigationDestination {
    var body: some View {
        switch self {
        case .productDetail(let product):
            ProductDetailScreen(product: product)
        case .editProduct(let product):
            EditProductScreen(product: product) { product in
                
            }
        }
    }
    
    var method: NavigationMethod {
        switch self {
        case .productDetail:
            return .push
        case .editProduct:
            return .sheet
        }
    }
}

