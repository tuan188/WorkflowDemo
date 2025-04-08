//
//  ListProductScreen.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import SwiftUI
import NavigatorUI

struct ListProductScreen: View {
    @Environment(\.navigator) var navigator: Navigator
    
    var onSelect: ((Product) -> Void)?
    var onEdit: ((Product) -> Void)?
    
    @State private var products: [Product] = [
        Product(id: 1, name: "Product 1", price: 10.0),
        Product(id: 2, name: "Product 2", price: 20.0),
        Product(id: 3, name: "Product 3", price: 30.0)
    ]
    
    var body: some View {
        List(products, id: \.id) { product in
            HStack {
                Text(product.name)
                    
                Spacer()
                    
                Text("Edit")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        onEdit?(product)
                    }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onSelect?(product)
            }
        }
    }
}
