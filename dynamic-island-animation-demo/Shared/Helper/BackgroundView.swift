//
//  BackgroundView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 2022/9/9.
//

import SwiftUI


struct BackgroundView: View {
    var cornerRadius: CGFloat = 30
    var body: some View {
        RoundedRectangle(cornerRadius: self.cornerRadius)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
