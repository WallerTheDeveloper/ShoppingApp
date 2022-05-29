import Foundation

class ProductsCartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0 // set is private but get is public
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        let selectedIndex = products.firstIndex(where: {$0.id == product.id})
        products.remove(at: selectedIndex!)
        total -= product.price
    }
    
    func removeAllFromCart() {
        products.removeAll()
        total = 0
    }
}
