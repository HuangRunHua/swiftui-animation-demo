import SwiftUI

struct ContentView: View {
    
    @State private var showAnimation = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            BackgroundView()
                .frame(width: 250, height: 80)
                
            HStack(spacing: 17) {
                PlusButton(showAnimation: $showAnimation)
                
                ZStack(alignment: .leading) {
                    TextView()
                        .frame(width: 157, height: 50)
                        .rotationEffect(showAnimation ? Angle(degrees: -90): Angle(degrees: 0), anchor: UnitPoint(x: -0.2, y: 0.5))
                        .opacity(showAnimation ? 0: 1)
                    HStack(spacing: 17) {
                        RecordButton()
                        CameraButton()
                        PhotoButton()
                    }       
                    .rotationEffect(showAnimation ? Angle(degrees: 0): Angle(degrees: 90), anchor: UnitPoint(x: -0.2, y: 0.5))
                    .opacity(showAnimation ? 1: 0)
                }
            }
            .padding()
        }
    }
}
