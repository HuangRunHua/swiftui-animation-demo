import SwiftUI

struct CircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.quaternary, in: Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1)
            .frame(width: 40, height: 40)
            .cornerRadius(20)
            .foregroundColor(.white)
    }
}

struct BasicImage: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(.white)
            .frame(width: 17, height: 17)
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(.quaternary, in: Capsule())            
            .foregroundColor(.white)
            .cornerRadius(40)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                self
                placeholder().opacity(shouldShow ? 1 : 0)
            }
        }
}
