//
//  FlexibleImage.swift
//  PhotoScaleEffect
//
//  Created by Runhua Huang on 9/14/22.
//

import Foundation

struct FlexibleImage: Identifiable {
    var id: UUID = UUID()
    var imageName: String
    var showDetail: Bool = false
    
    static var images: [FlexibleImage] = [
        FlexibleImage(imageName: "1"),
        FlexibleImage(imageName: "2"),
        FlexibleImage(imageName: "3"),
        FlexibleImage(imageName: "4"),
        FlexibleImage(imageName: "5"),
        FlexibleImage(imageName: "6"),
        FlexibleImage(imageName: "7"),
        FlexibleImage(imageName: "8"),
        FlexibleImage(imageName: "9"),
        FlexibleImage(imageName: "10"),
        FlexibleImage(imageName: "11"),
        FlexibleImage(imageName: "12"),
        FlexibleImage(imageName: "13"),
        FlexibleImage(imageName: "14"),
        FlexibleImage(imageName: "15"),
        FlexibleImage(imageName: "16"),
        FlexibleImage(imageName: "17"),
    ]
}
