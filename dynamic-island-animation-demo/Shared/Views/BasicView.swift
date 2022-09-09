//
//  BasicView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 2022/9/9.
//

import SwiftUI

struct BasicView: View {
    var body: some View {
        BackgroundView(cornerRadius: 30)
            .frame(width: 160, height: 60)
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
