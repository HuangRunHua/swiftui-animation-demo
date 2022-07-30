import SwiftUI

struct ContentView: View {
    
    @State private var checkButtonTapped: Bool = false
    @State private var showCheckmark: Bool = false
    @State private var backButtonDisabled: Bool = true
    @State private var scaleRate: Double = 1.0
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 98, height: 98)
                    .cornerRadius(50)
                
                Circle()
                    .trim(from: 0, to: self.checkButtonTapped ? 1: 0)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(lineWidth: 5, lineCap: .round)
                    )
                    .background(
                        Color.white
                    )
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .scaleEffect(scaleRate)
                
                /// Checkmark View.
                Checkmark()
                    .trim(from: 0, to: self.showCheckmark ? 1: 0)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                    .frame(width: 25, height: 25)
                    .offset(x: 7, y: 0)
                    .opacity(self.showCheckmark ? 1: 0)
            }
            .padding()
                
            
            Button { 
                withAnimation(.easeInOut(duration: 1)) { 
                    self.checkButtonTapped.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
                    withAnimation(.easeInOut(duration: 0.5)) { 
                        self.scaleRate = 0.001
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { 
                    withAnimation(.easeInOut(duration: 0.5)) { 
                        self.showCheckmark.toggle()
                    }
                }
                self.backButtonDisabled = false
            } label: { 
                Text("Tap to view the animation")
                    .foregroundColor(.green)
            }
            .padding()
            .disabled(!self.backButtonDisabled)
            
            Button { 
                withAnimation(.easeInOut(duration: 0.5)) { 
                    self.showCheckmark.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { 
                    withAnimation(.easeInOut(duration: 0.5)) { 
                        self.scaleRate = 1.0
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
                    withAnimation(.easeInOut(duration: 1)) { 
                        self.checkButtonTapped.toggle()
                    }
                }
                self.backButtonDisabled = true
            } label: { 
                Text("Back")
                    .foregroundColor(.green)
            }
            .disabled(self.backButtonDisabled)
        }
    }
}

struct Checkmark: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: -0.5 * width, y: 0.5 * height))
        path.addLine(to: .init(x: 0 * width, y: 1.0 * height))
        path.addLine(to: .init(x: 1 * width, y: 0 * height))
        return path
    }
}
