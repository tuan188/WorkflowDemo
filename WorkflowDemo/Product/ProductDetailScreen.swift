//
//  ProductDetailScreen.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import Foundation
import SwiftUI

struct ProductDetailScreen: View {
    let product: Product
    
    var body: some View {
        VStack {
            Text(product.name)
                .font(.largeTitle)
                .padding()
            Text("Price: \(product.price, specifier: "%.2f")")
                .font(.title)
                .padding()
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
