import SwiftUI

struct ContentView: View {
    
    @State private var currentColorIndex = 0
    @State private var scaleRate = 0.1
    
    private let colors: [Color] = [
        .purple, .brown, .green, .cyan, .mint, .orange, .pink
    ]
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    private var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 1)
            .repeatForever()
    }
    
    var body: some View {
        Circle()
            .foregroundColor(colors[currentColorIndex])
            .frame(width: 20, height: 20)
            .scaleEffect(scaleRate)
            .onAppear {
                withAnimation(self.repeatingAnimation) {
                    self.scaleRate = 3
                }
            }
            .onReceive(timer) { _ in
                self.currentColorIndex = (self.currentColorIndex + 1) >= self.colors.count ? 0: self.currentColorIndex + 1
            }
    }
}




