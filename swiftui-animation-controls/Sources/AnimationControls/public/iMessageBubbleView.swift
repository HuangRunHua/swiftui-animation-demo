import SwiftUI

public struct iMessageBubbleView: View {
    
    @State private var bubbleScaleRate: Double = 1.0
    @State private var dotColor: [Color] = [
        Color(red: 0.81, green: 0.82, blue: 0.84),
        Color(red: 0.72, green: 0.73, blue: 0.74),
        Color(red: 0.6, green: 0.6, blue: 0.61),
    ]
    @State private var dotsColorIndex: [Int] = [0, 1, 2]
    
    private var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 1)
            .repeatForever()
    }
    
    private var dotColorChangeAnimation: Animation {
        Animation
            .easeIn(duration: 0.5)
            .repeatForever()
    }
    
    private var circleView: some View {
        Circle()
            .frame(width: 25, height: 25)
    }
    
    
    public var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 43)
                    .foregroundColor(Color(red: 0.86, green: 0.87, blue: 0.88))
                    .background(.quaternary, in: Capsule())
                    .frame(width: 150, height: 86)
                HStack(spacing: 5) {
                    circleView
                        .foregroundColor(dotColor[dotsColorIndex[0]])
                    circleView
                        .foregroundColor(dotColor[dotsColorIndex[1]])
                    circleView
                        .foregroundColor(dotColor[dotsColorIndex[2]])
                }
            }
            Circle()
                .foregroundColor(Color(red: 0.86, green: 0.87, blue: 0.88))
                .frame(width: 30, height: 30)
                .offset(x: -60, y: 35)
            
            Circle()
                .foregroundColor(Color(red: 0.86, green: 0.87, blue: 0.88))
                .frame(width: 15, height: 15)
                .offset(x: -80, y: 55)
        }
        .scaleEffect(self.bubbleScaleRate)
        .onAppear {
            withAnimation(self.repeatingAnimation) {
                self.bubbleScaleRate = 1.1
            }
            
            withAnimation(self.dotColorChangeAnimation) {
                dotsColorIndex[0] = 2
                dotsColorIndex[1] = 0
                dotsColorIndex[2] = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(self.dotColorChangeAnimation) {
                    dotsColorIndex[0] = 1
                    dotsColorIndex[1] = 2
                    dotsColorIndex[2] = 0
                }
            }
        }
    }
}

