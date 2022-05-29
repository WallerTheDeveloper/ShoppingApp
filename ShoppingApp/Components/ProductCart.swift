import Foundation
import SwiftUI


struct ProductCart : View {
    
    var product: Product
    @EnvironmentObject var productsCartManager: ProductsCartManager
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(product.productName)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            .cornerRadius(20)
            Button {
                productsCartManager.addToCart(product: self.product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
            NavigationLink {
                ProductDetailsView(product: self.product)
            } label: {
                Image(systemName: "info.circle")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
            .offset(y:50)
        }
    }
}

struct ProductCart_Previews: PreviewProvider {
    static var previews: some View {
        ProductCart(product: productList[0])
            .environmentObject(ProductsCartManager())
    }
}
