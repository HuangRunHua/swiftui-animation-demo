import SwiftUI

struct ClapButton: View {
    
    @Binding var showBackgroundShadow: Bool
    @Binding var clapButtonTapped: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(self.clapButtonTapped ? Color.pinkRed:  self.showBackgroundShadow ? Color.pinkRed: Color.gray, style: StrokeStyle(lineWidth: 4))
                .background(Color.white)
                .cornerRadius(60)
                .frame(width: 120, height: 120)
                .shadow(color: .pinkRed, radius: self.showBackgroundShadow ? 5: 0)
            
            Image(systemName: self.clapButtonTapped ? "hands.clap.fill": "hands.clap")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(self.clapButtonTapped ? .pinkRed: self.showBackgroundShadow ? .pinkRed: .gray)
                .frame(width: 70, height: 70)
        }
    }
}

struct PlusLikeView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.pinkRed)
                .frame(width: 70, height: 70)
            
            Text("+1")
                .foregroundColor(.white)
                .font(.system(size: 25))
        }
    }
}


struct FireWorks: View {
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 3)
                .foregroundColor(.darkGreen)                
                .frame(width: 7, height: 7)
            Triangle()
                .foregroundColor(.darkOrange)
                .frame(width: 7, height: 10)
                .offset(x: 0, y: -30)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: -1 * width, y: 0 * height))
        path.addLine(to: .init(x: 1 * width, y: 0 * height))
        path.addLine(to: .init(x: 0 * width, y: 2 * height))
        path.addLine(to: .init(x: -0.2 * width, y: 2.4 * height))
        path.addLine(to: .init(x: 0.2 * width, y: 2.4 * height))
        return path
    }
}

struct FireWorksView: View {
    var body: some View {
        ZStack {
            FireWorks()
                .offset(x: 0, y: -70)
                .rotationEffect(Angle(degrees: 30), anchor: .topTrailing)
            
            FireWorks()
                .offset(x: 0, y: -60)
                .rotationEffect(Angle(degrees: 120), anchor: .topTrailing)
            
            FireWorks()
                .offset(x: 0, y: -80)
                .rotationEffect(Angle(degrees: 190), anchor: .topTrailing)
            FireWorks()
                .offset(x: 0, y: -100)
                .rotationEffect(Angle(degrees: 260), anchor: .topTrailing)
            FireWorks()
                .offset(x: 0, y: -95)
                .rotationEffect(Angle(degrees: 320), anchor: .topTrailing)
        }
    }
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        FireWorksView()
    }
}
