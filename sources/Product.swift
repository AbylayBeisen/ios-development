//
//  Product.swift
//  
//
//  Created by Abylai  on 02.10.2025.
//

import Coccoa

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category {
        case electronics
        case clothing
        case food
        case books
    }
    
    var displayPrice: String {
        return String(format: "%.2f", price)
    }
    
    init(name: String, price: Double, category: Category, description: String = "") {
        guard price >= 0 else {
            fatalError("Price cannot be negative")
        }
        
        self.id = UUID().uuidString
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}
