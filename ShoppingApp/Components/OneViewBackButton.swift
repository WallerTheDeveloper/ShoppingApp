import SwiftUI

struct OneViewBackButton: View {
    @State private var isLongPressed = false
    @GestureState private var isLongPressing = false
    
    var body: some View {
        ZStack {
            Text("Long press the button to return back")
                .frame(width: 100, height: 80, alignment: .center)
                .padding()
                .overlay(
                    Circle()
                        .stroke(Color.orange, lineWidth: 4)
                        .shadow(radius: 20)
                        .frame(width: 30)
                        .scaleEffect(isLongPressed ? 10 :  5)
                        .gesture(LongPressGesture(minimumDuration: 1.0, maximumDistance: 400)
                            .onEnded({ (_) in
                                self.isLongPressed.toggle()
                                
                            })
                            .updating($isLongPressing) { value, state, _ in
                                state = value
                            }
                    
                    )
                )
                
        }
    }
}

struct OneViewBackButton_Previews: PreviewProvider {
    static var previews: some View {
        OneViewBackButton()
    }
}
