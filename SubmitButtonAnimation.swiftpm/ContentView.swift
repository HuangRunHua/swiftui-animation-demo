import SwiftUI

struct ContentView: View {
    
    @State private var submitButtonTapped = false
    @State private var animationBegin = false
    @State private var submitTextScaledBack = false
    @State private var isLoadingComplete = false
    @State private var showCheckmark = false
    /// When the animation begin disable the button.
    @State private var disableButton = false
    /// Hide the background stroke view immediately 
    /// when checkmark appears.
    @State private var hideBackgroundStroke = false
    @State private var showReloadButton = false
    
    var body: some View {
        VStack {
            Button { 
                /// The background color should turn to fill with indigo color.
                /// The duration here is set to 0.3 seconds.
                withAnimation(.linear(duration: 0.3)) { 
                    self.submitButtonTapped.toggle()
                }
                /// When submitButtonTapped is true, the `Submit` text will scale.
                /// After 0.2 secs, we need it to scale back.
                /// The duration here is set to 0.1 secs.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { 
                    withAnimation(.linear(duration: 0.1)) {            
                        self.submitTextScaledBack.toggle()
                    }
                }
                /// After 0.4 secs, the rounded rectangle will turn to a Circle
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { 
                    withAnimation(.linear(duration: 0.2)) {            
                        self.animationBegin.toggle()
                    }
                }
                /// After 5 seconds, the loading process is successfully done.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { 
                    withAnimation(.linear(duration: 5)) {            
                        self.isLoadingComplete.toggle()
                    }
                }
                /// When the loading process is successfully done
                /// show the checkmark view.
                /// The duration of checkmark animation is set to 02 secs.
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) { 
                    self.hideBackgroundStroke.toggle()
                    withAnimation(.linear(duration: 0.3)) { 
                        self.showCheckmark.toggle()
                    }
                }
                /// After the animation ends, show the reload button.
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.8) { 
                    self.showReloadButton.toggle()
                }
                
            } label: { 
                RoundedRectangle(cornerRadius: 40)
                    .stroke(
                        self.animationBegin ? Color.gray: Color.lightGreen, 
                        lineWidth: self.hideBackgroundStroke ? 0: self.animationBegin ? 15:  self.submitButtonTapped ? 0: 4
                    )
                    .background(
                        self.showCheckmark ? Color.lightGreen: self.animationBegin ? .clear: self.submitButtonTapped ? Color.lightGreen: Color.clear
                    )
                    .cornerRadius(40)
                    .frame(width: self.showCheckmark ? 300: self.animationBegin ? 80: 300, height: 80)
                    .overlay {
                        /// The animation of this text is shown in the following way:
                        /// When tap the button, text view will scale and then scale back
                        /// Finally, it will disappear.
                        Text("Submit")
                            .font(.title2)
                            .foregroundColor(self.submitButtonTapped ? .white: .lightGreen)
                            .scaleEffect(self.submitTextScaledBack ? 1: self.submitButtonTapped ? 1.2: 1)
                            .opacity(self.animationBegin ? 0: 1)
                        
                        /// This circle is the loading view.
                        Circle()
                            .trim(from: 0, to: self.isLoadingComplete ? 1: 0.1)
                            .rotation(Angle(degrees: -90))
                            .stroke(Color.lightGreen, lineWidth: 7)
                            .frame(width: 72, height: 72)
                            .opacity(self.showCheckmark ? 0: self.animationBegin ? 1: 0)
                        
                        /// Checkmark View.
                        Checkmark()
                            .trim(from: 0, to: self.showCheckmark ? 1: 0)
                            .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                            .frame(width: 25, height: 25)
                            .offset(x: 7, y: 0)
                            .opacity(self.showCheckmark ? 1: 0)
                    }
            }
            .disabled(self.disableButton)
            .onChange(of: self.submitButtonTapped) { newValue in
                self.disableButton = newValue
            }
            
            Button { 
                self.submitButtonTapped = false
                self.animationBegin = false
                self.submitTextScaledBack = false
                self.isLoadingComplete = false
                self.showCheckmark = false
                self.disableButton = false
                self.hideBackgroundStroke = false
                self.showReloadButton = false
            } label: { 
                Label("Reload", systemImage: "arrow.clockwise")
                    .foregroundColor(.gray)
            }
            .padding()
            .opacity(self.showReloadButton ? 1: 0)
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

extension Color {
    static let lightGreen = Color(red: 0.357, green: 0.757, blue: 0.576)
}

