import SwiftUI

struct ContentView: View {
    
    @State private var buttonTapped: Bool = false
    @State private var loading: Bool = false
    @State private var loadingError: Bool = false
    @State private var shakeAnimationBegins: Bool = false
    @State private var reloadButtonAppear: Bool = false
    @State private var reloadButtonTapped: Bool = false
    @State private var reloading: Bool = false
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        ZStack {
            Color.lightPink
            VStack {
                Button { 
                    withAnimation(.easeInOut(duration: 0.3)) { 
                        self.buttonTapped.toggle()
                    }
                    withAnimation(.easeInOut(duration: 3)) { 
                        self.loading.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
                        withAnimation(.easeInOut(duration: 0.3)) { 
                            self.loadingError.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
                        withAnimation(.easeInOut(duration: 0.3)) { 
                            self.shakeAnimationBegins.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) { 
                        withAnimation(.easeInOut(duration: 0.1)) { 
                            self.reloadButtonAppear.toggle()
                        }
                    }
                    
                } label: { 
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .frame(width: self.buttonTapped ? 80: 170, height: 80)
                            .foregroundColor(self.showCheckmark ? .lightGreen:  self.reloadButtonTapped ? .white:  self.loadingError ? .orange: .white)
                            .shadow(radius: 5, x: 0, y: 5)
                        
                        ExclamationMark()
                            .rotationEffect(self.loadingError ? Angle(degrees: 0): Angle(degrees: -90))
                            .scaleEffect(self.reloadButtonTapped ? 0.001: self.loadingError ? 1: 0.001)
                            .opacity(self.reloadButtonTapped ? 0: self.loadingError ? 1: 0)
                            .offset(x: 0, y: 5)
                        
                        Circle()
                            .trim(from: 0, to: 0.8)
                            .stroke(Color.darkGreen, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                            .frame(width: 30, height: 30)
                            .rotationEffect(self.reloading ? Angle(degrees: 1575*2): self.loading ? Angle(degrees: 1575): Angle(degrees: -135))
                            .scaleEffect(self.reloadButtonTapped ? 1: self.loadingError ? 0.001: self.buttonTapped ? 1: 0.001)
                            .opacity(self.showCheckmark ? 0: self.reloadButtonTapped ? 1: self.loadingError ? 0: self.buttonTapped ? 1: 0)
                        
                        RightArrow()
                            .offset(x: 20, y: 24)
                            .rotationEffect(Angle(degrees: self.buttonTapped ? 135: 0))
                            .opacity(self.loadingError ? 0: self.buttonTapped ? 0: 1)
                        
                        Checkmark()
                            .trim(from: 0, to: self.showCheckmark ? 1: 0)
                            .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                            .frame(width: 25, height: 25)
                            .offset(x: 7, y: 0)
                            .opacity(self.showCheckmark ? 1: 0)
                    }
                    .modifier(self.shakeAnimationBegins ? Shake(animatableData: CGFloat(1)): Shake(animatableData: CGFloat(0)))
                }
                
                Button { 
                    withAnimation(.easeInOut(duration: 0.2)) { 
                        self.reloadButtonTapped.toggle()
                    }
                    withAnimation(.easeInOut(duration: 3)) { 
                        self.reloading.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
                        withAnimation(.easeInOut(duration: 0.4)) { 
                            self.showCheckmark.toggle()
                        }
                    }
                    self.reloadButtonAppear.toggle()
                } label: { 
                    Text("Reload")
                        .foregroundColor(.orange)
                }
                .padding()
                .opacity(self.reloadButtonAppear ? 1: 0)
            }
            
        }
    }
}

