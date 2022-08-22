//
//  ContentView.swift
//  TwitterLikeAnimation
//
//  Created by Runhua Huang on 2022/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonTapped: Bool = false
    /// For heart with red color.
    @State private var showRedHeart: Bool = false
    @State private var redHeartScale: CGFloat = 0.2
    
    @State private var hideTwoCircles: Bool = true
    @State private var colorCircleScaleRate: CGFloat = 0.2
    @State private var colorCircleColor: Color = .darkPink
    @State private var whiteCircleScaleRate: CGFloat = 0.01
    /// For the binary circle.
    @State private var binaryCircleSpacing: CGFloat = 0.0
    @State private var binaryCircleRotateAngle: CGFloat = 45.0
    @State private var binaryCircleScaleRate: CGFloat = 1.0
    @State private var binaryCircleOffset: CGFloat = -58
    @State private var showBinaryCircleRing: Bool = false
    
    @State private var isLike: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(colorCircleColor)
                .scaleEffect(colorCircleScaleRate)
                .frame(width: 100, height: 100)
                .opacity(self.hideTwoCircles ? 0: 1)

            Circle()
                .foregroundColor(colorScheme == .light ? .white: .black)
                .scaleEffect(whiteCircleScaleRate)
                .frame(width: 100, height: 100)
                .opacity(self.hideTwoCircles ? 0: 1)
            
            binaryCircleRing
                .opacity(self.showBinaryCircleRing ? 1: 0)
            
            Button {
                self.isLike ? restoreButton(): like()
            } label: {
                Image(systemName: self.isLike ? "heart.fill": "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(self.showRedHeart ? .darkPink: .gray)
                    .frame(width: 100, height: 100)
                    .scaleEffect(self.buttonTapped ? self.redHeartScale: 1)
            }
            .buttonStyle(.plain)
            .opacity(self.showRedHeart ? 1: self.buttonTapped ? 0: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var binaryCircleRing: some View {
        ZStack {
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(0), anchor: .center)
                .foregroundColor(.lightBlue)
            
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(360/7), anchor: .center)
                .foregroundColor(.purple)
            
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(360*2/7), anchor: .center)
                .foregroundColor(.lightGreen)
            
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(360*3/7), anchor: .center)
                .foregroundColor(.lightRed)
            
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(360*4/7), anchor: .center)
                .foregroundColor(.lightBlue)
            
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(360*5/7), anchor: .center)
                .foregroundColor(.purple)
            
            BinaryCircle(spacing: $binaryCircleSpacing, rotateAngle: $binaryCircleRotateAngle, scaleRate: $binaryCircleScaleRate)
                .offset(y: self.binaryCircleOffset)
                .frame(width: 30, height: 20)
                .rotationEffect(.degrees(360*6/7), anchor: .center)
                .foregroundColor(.lightGreen)
        }
    }
}


extension ContentView {
    private func like() {
        withAnimation(.easeInOut(duration: 0.01)) {
            self.buttonTapped.toggle()
            self.isLike.toggle()
            self.hideTwoCircles.toggle()
        }
        withAnimation(.easeInOut(duration: 0.2)) {
            self.colorCircleScaleRate = 1.2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.colorCircleColor = .purple
                self.whiteCircleScaleRate = 1.13
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeInOut(duration: 0.1)) {
                self.showBinaryCircleRing.toggle()
                self.hideTwoCircles.toggle()
                self.showRedHeart.toggle()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.binaryCircleRotateAngle = -45
                self.binaryCircleOffset = -100
                self.binaryCircleScaleRate = 1.2
                self.binaryCircleSpacing = 10
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.1)) {
                self.redHeartScale = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.easeInOut(duration: 0.2)) {
                self.showBinaryCircleRing.toggle()
            }
        }
    }
    
    private func restoreButton() {
        self.buttonTapped = false
        self.showRedHeart = false
        self.redHeartScale = 0.2
        self.colorCircleScaleRate = 0.2
        self.colorCircleColor = .darkPink
        self.whiteCircleScaleRate = 0.01
        self.binaryCircleSpacing = 0.0
        self.binaryCircleRotateAngle = 45.0
        self.binaryCircleScaleRate = 1.0
        self.binaryCircleOffset = -58
        self.showBinaryCircleRing = false
        self.hideTwoCircles = true
        self.isLike = false
    }
}
