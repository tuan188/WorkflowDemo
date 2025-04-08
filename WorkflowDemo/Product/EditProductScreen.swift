//
//  EditProductScreen.swift
//  WorkflowDemo
//
//  Created by truong.anh.tuan on 6/4/25.
//

import SwiftUI

struct EditProductScreen: View {
    @Environment(\.dismiss) var dismiss
    
    let product: Product
    var onSave: (Product) -> Void
    
    @State private var productName: String = ""
    
    var body: some View {
        Form {
            Text("Edit Product")
                .navigationTitle("Edit Product")
                .navigationBarTitleDisplayMode(.inline)
            
            TextField("Product Name", text: $productName)
                .padding()
            
            Button(action: {
                var updatedProduct = product
                updatedProduct.name = productName
                onSave(updatedProduct)
                dismiss()
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .onAppear {
            productName = product.name
        }
    }
}
