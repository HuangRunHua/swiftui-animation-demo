import SwiftUI

struct ContentView: View {
    /// When on hover, show button's shadow.
    @State private var showBackgroundShadow: Bool = false
    /// The marker of whether the button is clapped.
    @State private var clapButtonTapped: Bool = false
    /// The scale rate of the button.
    @State private var scaleRate: CGFloat = 1.0
    /// If already clapped, disable the scale effect when tap button again.
    @State private var clapped: Bool = false
    /// Hide the plus like `+1` view.
    @State private var showPlusView: Bool = false
    /// Move and hide the plus view after 0.3 secs
    @State private var moveAndHidePlusView: Bool = false
    /// Hide the fireworks view
    @State private var hideFireWorks: Bool = false
    
    var body: some View {
        ZStack {
            /// The whole background color is set to white.
            Color.white
            /// Main actor.
            ClapButton(showBackgroundShadow: $showBackgroundShadow, clapButtonTapped: $clapButtonTapped)
                .scaleEffect(self.clapped ? 1: self.scaleRate)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)) { 
                        self.clapButtonTapped.toggle()
                        self.scaleRate = 1.2
                        self.showPlusView.toggle()
                    }
                    /// After 0.1 sec, scale the button back.
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { 
                        withAnimation(.easeInOut(duration: 0.3)) { 
                            self.scaleRate = 1.0
                            self.clapped.toggle()
                        }
                    }
                    
                    /// If already clapped we need to toggle the flag first
                    /// so that when next clap action happens the plus one view 
                    /// will appears.
                    if clapped {
                        self.moveAndHidePlusView = false
                        self.hideFireWorks = false
                    } else {
                        /// After 0.1 sec, hide the fireworks view
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { 
                            withAnimation(.easeInOut(duration: 0.3)) { 
                                self.hideFireWorks = true
                            }
                        }
                        /// After 0.3 sec, hide the plus one view.
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.6) { 
                            withAnimation(.easeInOut(duration: 0.3)) { 
                                self.moveAndHidePlusView = true
                            }
                        }
                    }
                    
                }
                .onHover { newValue in
                    withAnimation(.easeInOut(duration: 0.1)) { 
                        self.showBackgroundShadow = newValue
                    }
                }
            
            PlusLikeView()
                .offset(x: 0, y: self.moveAndHidePlusView ? -180: self.showPlusView ? -150: -130)
                .opacity(self.moveAndHidePlusView ? 0: self.showPlusView ? 1: 0)
            
            FireWorksView()
                .scaleEffect(self.hideFireWorks ? 1.3: self.scaleRate)
                .opacity(self.hideFireWorks ? 0: self.clapButtonTapped ? 1: 0)
            
        }
    }
}
