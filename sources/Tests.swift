//
//  Tests.swift
//  
//
//  Created by Abylai  on 02.10.2025.
//

import Cocoa

func runTests(){
    let laptop = Product(
        name: "MacBook Pro",
        price: 1999.99,
        category: .electronics,
        description: "16-inch MacBook Pro"
    )
    let book = Product(
        name: "Swift Programming",
        price: 49.99,
        category: .books,
        description: "Learn Swift programming"
    )
    
    let headphones = Product(
        name: "AirPods Pro",
        price: 249.99,
        category: .electronics,
        description: "Wireless headphones"
    )
    print("1. Created products: \(laptop.name), \(book.name), \(headphones.name)")
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    
    print("2 items were added to a cart")
    print("   Cart item count: \(cart.itemCount)")
    
    cart.addItem(product: laptop, quantity: 1)
        let laptopQuantity = cart.items.first { $0.product.id == laptop.id }?.quantity ?? 0
        print("3. Added laptop again - quantity: \(laptopQuantity) (should be 2)")
    
    print("4. Cart calculations:")
        print("   Subtotal: \(cart.subtotal)")
        print("   Item count: \(cart.itemCount)")
    
    cart.discountCode = "10%"
        print("5. Applied discount code '10%'")
        print("   Discount amount: \(cart.discountAmount)")
        print("   Total with discount: \(cart.total)")
    
    cart.removeItem(productId: book.id)
        print("6. Removed book from cart")
        print("   Cart item count: \(cart.itemCount)")
    
    func modifyCart(_ cart: ShoppingCart) {
            cart.addItem(product: headphones, quantity: 1)
        }
    
    let itemsBeforeModification = cart.itemCount
        modifyCart(cart)
        let itemsAfterModification = cart.itemCount
        
        print("7. Reference type demonstration:")
        print("   Items before modification: \(itemsBeforeModification)")
        print("   Items after modification: \(itemsAfterModification)")
        print("   Original cart was modified (reference semantics)")
    
    let item1 = CartItem(product: laptop, quantity: 1)
        var item2 = item1
        item2.updateQuantity(5)
        
        print("8. Value type demonstration:")
        print("   Item1 quantity: \(item1.quantity) (should be 1)")
        print("   Item2 quantity: \(item2.quantity) (should be 5)")
        print("   Item1 not affected by Item2 changes (value semantics)")
    
    let address = Address(
            street: "123 Main St",
            city: "San Francisco",
            zipCode: "94101",
            country: "USA"
        )
        
        let order = Order(from: cart, shippingAddress: address)
        print("9. Created order from cart")
        print("   Order ID: \(order.orderId)")
        print("   Order items count: \(order.itemCount)")
        
        cart.clearCart()
        print("10. Modified cart after order creation:")
        print("    Order items count: \(order.itemCount) (should not be 0)")
        print("    Cart items count: \(cart.itemCount) (should be 0)")
        print("    Order preserved original items (immutable snapshot)")
        
        print("\n=== All tests completed successfully! ===")
    }
    
runTests()
