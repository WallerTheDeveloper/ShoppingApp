import SwiftUI

struct ThankYouView: View {
    @EnvironmentObject var productsCartManager: ProductsCartManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var pickedMethod: String
    
    var body: some View {
        VStack {
            Text("Thank you! Payment successful!")
            Text("Picked method of payment is: ")
            Text(pickedMethod).font(Font.system(size:24).italic().bold())
                                                                          
            Button(action: {
                self.mode.wrappedValue.dismiss()
                productsCartManager.removeAllFromCart()
            }) {
                Image(systemName: "arrow.backward.circle.fill")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
        .navigationBarHidden(true)
    }   
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView(pickedMethod: .constant("Crypto"))
            .environmentObject(ProductsCartManager())
    }
}
