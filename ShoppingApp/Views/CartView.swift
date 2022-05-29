import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: ProductsCartManager
    @State private var pickedMethod: String = "Crypto"
    var methodsOfPayment = ["Crypto", "Visa", "Mastercard", "Paypal"]

    
    var body: some View {
        List {
            if cartManager.products.count > 0 {
                HStack {
                    Button(action: {
                        cartManager.removeAllFromCart()
                    }) {
                        Text("Remove all from cart")
                    }
                }
                
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            withAnimation(.linear(duration: 0.4)) {
                                cartManager.removeFromCart(product: product)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                VStack {
                    Picker(selection: $pickedMethod) {
                        ForEach(methodsOfPayment, id: \.self) {
                            Text($0)
                        }
                    } label: {
                        Text("Choose you payment method")
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                NavigationLink {
                    ThankYouView(pickedMethod: $pickedMethod)
                        .environmentObject(cartManager)
                } label: {
                    Image(systemName: "dollarsign.circle.fill")
                        .aspectRatio(contentMode: .fill)
                }
                .padding()
            } else {
                Text("Your cart is empty.")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ProductsCartManager())
    }
}
