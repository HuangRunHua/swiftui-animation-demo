//
//  BinaryCircle.swift
//  TwitterLikeAnimation
//
//  Created by Runhua Huang on 2022/8/22.
//

import SwiftUI

struct BinaryCircle: View {
    @Binding var spacing: CGFloat
    @Binding var rotateAngle: CGFloat
    @Binding var scaleRate: CGFloat
    
    var body: some View {
        HStack(spacing: spacing) {
            Circle()
                .scaleEffect(1/self.scaleRate)
            Circle()
                .scaleEffect(self.scaleRate)
        }
        .rotationEffect(.degrees(rotateAngle), anchor: .center)
    }
}

struct BinaryCircle_Previews: PreviewProvider {
    static var previews: some View {
        BinaryCircle(spacing: .constant(0), rotateAngle: .constant(45), scaleRate: .constant(1))
    }
}
