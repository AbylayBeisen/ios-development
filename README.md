2. **README.md** file (300-500 words) answering:
   - **Why did you choose class for ShoppingCart?**
   - **Why did you choose struct for Product and Order?**
   - **Explain one example where reference semantics matter in your code**
   - **Explain one example where value semantics matter in your code**
   - **What challenges did you face and how did you solve them?**

   - **Why did you choose class for ShoppingCart?**
   
I chose to implement ShoppingCart as a class because it represents a mutable entity with identity and state that needs to be shared and modified throughout the application lifecycle. A shopping cart maintains persistent state (items, quantities, totals) and needs reference semantics to ensure all parts of the application are working with the same cart instance. Using a class allows multiple view controllers or managers to reference and modify the same cart, maintaining data consistency across the entire shopping experience.

   - **Why did you choose struct for Product and Order?**
   
I implemented both Product and Order as structs because they represent immutable value types with well-defined data. Products are fixed entities with properties like ID, name, and price that don't change during the shopping process. Orders, once created, become immutable snapshots of a transaction at a specific point in time. Using value semantics ensures data integrity - when you pass around a Product or Order, you get an independent copy, preventing accidental mutations. This aligns with Swift's preference for value types where appropriate and provides thread safety benefits.

   - **Explain one example where reference semantics matter in your code**
   
   Reference semantics are crucial in the relationship between ShoppingCartManager and ShoppingCart. The manager holds a reference to the cart instance and various view controllers also reference the same cart:
   
   class ShoppingCartManager {
    private(set) var cart: ShoppingCart
    
    func addProduct(_ product: Product, quantity: Int) {
        cart.addItem(product, quantity: quantity)
    }
}
When a product is added to the cart through the manager, any UI component observing the cart (like a cart badge or total display) immediately reflects the change because they all reference the same cart instance.

   - **Explain one example where value semantics matter in your code**
Value semantics are essential when creating new Order instances from the shopping cart:

func createOrder(from cart: ShoppingCart) -> Order {
    let orderItems = cart.items.map { item in
        OrderItem(product: item.product, quantity: item.quantity)
    }
    return Order(id: UUID(), items: orderItems, date: Date())
}

Here, the order is created as an independent copy of the cart's state at that moment. This ensures the order represents a fixed transaction record that won't change even if the user continues modifying their cart after checkout. The value semantics guarantee data integrity for completed orders.

   - **What challenges did you face and how did you solve them?**
The main challenge was managing the shared state of the shopping cart while preventing race conditions in a potentially multi-threaded environment. Multiple view controllers could attempt to modify the cart simultaneously, leading to inconsistent state.

I solved this by:

Encapsulating cart modifications within the ShoppingCartManager class
Using a serial dispatch queue to ensure thread-safe access to the cart
Implementing a publisher-subscriber pattern using PassthroughSubject to notify observers of state changes in a controlled manner
Making Product and Order immutable to eliminate shared mutable state concerns

