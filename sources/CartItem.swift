//
//  CartItem.swift
//  
//
//  Created by Abylai  on 02.10.2025.
//

import Cocoa

struct CartItem {
    let product: Product
    private(set) var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    init(product: Product, quantity: Int = 1) {
        self.product = product
        self.quantity = max(quantity, 1)
    }
    
    mutating func increaseQuantity(by amount: Int = 1) {
        guard amount > 0 else { return }
        quantity += amount
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else { return }
        quantity = newQuantity
    }
}
