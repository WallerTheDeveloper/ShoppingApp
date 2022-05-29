import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var productsCartManager: ProductsCartManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var product: Product
    @State var didLongPress = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(50)
                        .frame(width: geo.size.width, height: geo.size.height * 0.45, alignment: .center)
                        .onTapGesture {
                            
                        }
                
                    Text("Product name: \(product.productName)")
                        .frame(width: geo.size.width, height: geo.size.height * 0.15, alignment: .center)
                        .font(Font.system(size: 36).bold())
                    Text("Product price: \(product.price)$")
                        .frame(width: geo.size.width, height: geo.size.height * 0.10, alignment: .leading)
                        .font(Font.system(size:24).italic())
                    Text("Product name: \(product.description)")
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                        .font(Font.system(size:24).italic())
                    
                    Button(action: {
                        if didLongPress {
                            self.mode.wrappedValue.dismiss()
                            didLongPress = false
                        }
                    }) {
                        OneViewBackButton()
                    }
                    .simultaneousGesture(LongPressGesture().onEnded({ _ in
                        didLongPress = true
                        print("Long press!")
                    }))
                }
                .navigationTitle(Text("Product Information"))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[0])
            .environmentObject(ProductsCartManager())
    }
}
