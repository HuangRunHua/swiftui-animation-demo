import SwiftUI

struct PlusButton: View {
    
    @State private var showOtherButtons = false
    @Binding var showAnimation: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 1)) { 
                self.showOtherButtons.toggle()
                self.showAnimation.toggle()
            }
        }) {
            BasicImage(systemName: "plus")
        }
        .buttonStyle(CircleButtonStyle())
        .rotationEffect(showOtherButtons ? Angle(degrees: -135): Angle(degrees: 0))
    }
}

struct RecordButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            BasicImage(systemName: "video")
        }
        .buttonStyle(CircleButtonStyle())
    }
}

struct CameraButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            BasicImage(systemName: "camera")
        }
        .buttonStyle(CircleButtonStyle())
    }
}

struct PhotoButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            BasicImage(systemName: "photo")
        }
        .buttonStyle(CircleButtonStyle())
    }
}

struct TextView: View {
    @State private var text: String = ""
    var body: some View {
        TextField("", text: $text)
            .placeholder(when: text.isEmpty) { 
                Text("Message")
                    .foregroundColor(.white)
                    .padding(.leading, 25)
            }
            .textFieldStyle(OvalTextFieldStyle())
    }
}

struct BackgroundView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(Color.indigo)
            .shadow(color: .indigo, radius: 40, x: 0, y: 10)
    }
}
