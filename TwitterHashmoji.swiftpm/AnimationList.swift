//
//  AnimationList.swift
//  TwitterGenshinAnimation
//
//  Created by Runhua Huang on 2025/4/15.
//

import SwiftUI

struct AnimationImage: Identifiable {
    let id: UUID = UUID()
    let image: String
    
    static let animationImages: [AnimationImage] = [
        AnimationImage(image: "doge"),
        AnimationImage(image: "emoji2"),
        AnimationImage(image: "doge2"),
    ]
}

struct AnimationList: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(AnimationImage.animationImages) { image in
                        TwitterAnimationButton(image: image.image)
                            .frame(width: 2000, height: 200)
                    }
                }
            }
            .navigationTitle("星期二")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AnimationList()
}
