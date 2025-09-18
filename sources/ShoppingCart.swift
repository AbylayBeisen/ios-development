//
//  ShoppingCart.swift
//  
//
//  Created by Abylai  on 02.10.2025.
//

import Cocoa

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            var updatedItem = items[index]
            updatedItem.increaseQuantity(by: quantity)
            items[index] = updatedItem
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }
    
    func removeItem(productId: String) {
        items.removeAll { $0.product.id == productId }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        return items.reduce(0.0) { $0 + $1.subtotal }
    }
    
    var total: Double {
        return subtotal - discountAmount
    }
    
    var discountAmount: Double {
        switch discountCode {
        case "10%":
            return subtotal * 0.1
        case "20%":
            return subtotal * 0.2
        case "30%":
            return subtotal * 0.3
        default: return 0
        }
    }
    
    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
}
