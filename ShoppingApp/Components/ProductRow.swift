import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: ProductsCartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.productName)
                    .bold()

                Text("$\(product.price)")
            }
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[0])
            .environmentObject(ProductsCartManager())
    }
}
