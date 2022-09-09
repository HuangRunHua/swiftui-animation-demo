//
//  LockView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 2022/9/9.
//

import SwiftUI

struct LockView: View {
    
    
    
    var body: some View {
        VStack(spacing: -12) {
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.15, to: 0.75)
                .stroke(.gray, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: 40, height: 20)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y:1, z:0), anchor: .center, anchorZ: 0, perspective: 1)
//            RoundedRectangle(cornerRadius: 7)
//                .aspectRatio(1.25, contentMode: .fit)
//                .foregroundColor(.gray)
//                .frame(width: 35)
        }
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}
