//
//  ImageDetailView.swift
//  PhotoScaleEffect
//
//  Created by Runhua Huang on 9/14/22.
//

import SwiftUI

struct ImageDetailView: View {
    
    let image: FlexibleImage
    var displayMode: DisplayMode
    
    enum DisplayMode {
        case thumbnail
        case original
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image(image.imageName)
                    .resizable()
                    .aspectRatio(contentMode: displayMode == .original ? .fit: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .compositingGroup()
        .clipped()
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageDetailView(image: FlexibleImage.images[3], displayMode: .thumbnail)
                .frame(width: 180, height: 180)
                .previewDisplayName("Thumbnail")
            
            ImageDetailView(image: FlexibleImage.images[3], displayMode: .original)
                .previewDisplayName("Original")
        }
    }
}
