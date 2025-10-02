//
//  lab3.swift
//
//
//  Created by Abylai  on 02.10.2025.
//

//1.1
import Cocoa

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

//1.2
struct CartItem {
    let product: Product
    var quantity: Int
    
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

//2
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
// 3.1

struct Address{
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        return """
            \(street)
            \(city), \(zipCode)
            \(country)
            """
    }
    init(street: String, city: String, zipCode: String, country: String) {
            self.street = street
            self.city = city
            self.zipCode = zipCode
            self.country = country
        }
}
struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address){
        self.orderId = UUID().uuidString
                self.items = cart.items
                self.subtotal = cart.subtotal
                self.discountAmount = cart.discountAmount
                self.total = cart.total
                self.timestamp = Date()
                self.shippingAddress = shippingAddress
    }
    var itemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
}
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
        
    }
    
runTests()
