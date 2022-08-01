import SwiftUI

struct ExclamationMark: View {
    var body: some View {
        VStack(spacing: 0) {
            VerticalLine()
                .trim(from: 0, to: 1)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 20, height: 20)
                .offset(x: 10, y: 0)
            Circle()
                .foregroundColor(.white)
                .frame(width: 7, height: 7)
        }
    }
}

struct RightArrow: View {
    var body: some View {
        HStack(spacing: -50) {
            Line()
                .trim(from: 0, to: 1)
                .stroke(Color.darkGreen, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            Arrow()
                .trim(from: 0, to: 1)
                .stroke(Color.darkGreen, style: StrokeStyle(lineWidth: 5, lineCap: .round))
        }
        .frame(width: 50, height: 50)
    }
}


struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: 0.25 * width, y: -0.25 * height))
        path.addLine(to: .init(x: 0.5 * width, y: 0 * height))
        path.addLine(to: .init(x: 0.25 * width, y: 0.25 * height))
        return path
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: -0.25 * width, y: 0 * height))
        path.addLine(to: .init(x: 0.5 * width, y: 0 * height))
        return path
    }
}

struct VerticalLine: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: 0 * width, y: -0.5 * height))
        path.addLine(to: .init(x: 0 * width, y: 0.5 * height))
        return path
    }
}


struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
                                                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                                              y: 0))
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

