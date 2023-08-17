import SwiftUI

struct ContentView: View {
    typealias Seconds = CGFloat
    /// 设定Image的缩放规则
    private enum ImageScaleRate: CGFloat {
        case original = 0.6
        case large = 1.4
        case small = 0.1
    }
    /// 设定heart的缩放规则
    private enum HeartScaleRate: CGFloat {
        case normal = 1.0
        case small = 0.1
        case large = 1.5
    }
    /// 用于判断当前heart的状态与处理点击heart触发的事件
    @State private var isLike: Bool = false
    /// 初始状态下Image的大小
    @State private var imageScaleRate: ImageScaleRate = .original
    /// 初始状态下heart的大小
    @State private var heartScaleRate: HeartScaleRate = .normal
    /// Red heart应当在Image消失后出现，此时为true
    @State private var showReadHeart: Bool = false
    /// 由于heart会分两次出现，一次是刚刚开始的时候以没有填充的姿态出现
    /// 一次是在Image消失之后以红色的状态出现
    @State private var bottonTapped: Bool = false
    /// 初始状态下与Image缩小之后隐藏Image使用
    @State private var hideImage: Bool = true
    
    /// 点击heart后的动画持续时间，包括heart突然消失与图片的突然出现
    private let tapReactionTimer: Seconds = 0.01
    /// 图片放大持续时间
    private let imageEnlargeTimer: Seconds = 0.25
    /// 图片缩小持续时间
    private let imageZoomOutTimer: Seconds = 0.25
    /// 图片开始缩小的时刻
    private var imageZoomOutStartingTime: Seconds {
        /// 在这里让图片放大后保持 0.15 秒钟的时间
        return imageEnlargeTimer + 0.15
    }
    /// heart开始出现并准备放大的时间
    private var heartZoomInStartingTime: Seconds {
        return imageZoomOutStartingTime + imageZoomOutTimer
    }
    /// heart放大持续的时间
    private let heartZoomInTimer: Seconds = 0.1
    /// dismiss阶段heart放大与缩小持续时间
    private let dismissHeartZoomInTimer: Seconds = 0.15
    /// dismiss阶段heart放大后缩小的开始时间
    private var dismissHeartZoomOutStartingTime: Seconds {
        return dismissHeartZoomInTimer + 0.1
    }
    
    var body: some View {
        ZStack {
            Image("emoji2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(imageScaleRate.rawValue)
                .offset(x: 0, y: -10)
                .opacity(self.hideImage ? 0 : 1)
            
            Button(action: {
                isLike ? unlike() : like()
            }, label: {
                Image(systemName: self.isLike ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(self.isLike ? .darkPink : .gray)
                    .opacity(self.showReadHeart ? 1: self.bottonTapped ? 0 : 1)
                    .scaleEffect(heartScaleRate.rawValue)
                    
            })
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
}


extension ContentView {
    private func like() {
        withAnimation(.easeInOut(duration: tapReactionTimer)) { 
            self.bottonTapped.toggle()
            self.isLike.toggle()
            self.hideImage.toggle()
            self.heartScaleRate = .small
        }
        withAnimation(.easeInOut(duration: imageEnlargeTimer)) {
            self.imageScaleRate = .large
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + imageZoomOutStartingTime) {
            withAnimation(.easeInOut(duration: imageZoomOutTimer)) {
                self.imageScaleRate = .small
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + heartZoomInStartingTime) {
            self.hideImage = true
            self.showReadHeart = true
            withAnimation(.easeInOut(duration: heartZoomInTimer)) {
                self.heartScaleRate = .normal
            }
        }
    }
    private func unlike() {
        self.imageScaleRate = .original
        self.bottonTapped = false
        self.isLike = false
        self.hideImage = true
        self.showReadHeart = false
        withAnimation(.easeInOut(duration: dismissHeartZoomInTimer)) { 
            self.heartScaleRate = .large
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + dismissHeartZoomOutStartingTime) {
            withAnimation(.easeInOut(duration: dismissHeartZoomInTimer)) { 
                self.heartScaleRate = .normal
            }
        }
    }
}
