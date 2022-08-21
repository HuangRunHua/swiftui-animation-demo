//
//  File.swift
//  
//
//  Created by Runhua Huang on 2022/8/21.
//

import SwiftUI

internal struct Checkmark: Shape {
    internal func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        
        var path = Path()
        path.move(to: .init(x: -0.5 * width, y: 0.5 * height))
        path.addLine(to: .init(x: 0 * width, y: 1.0 * height))
        path.addLine(to: .init(x: 1 * width, y: 0 * height))
        return path
    }
}
