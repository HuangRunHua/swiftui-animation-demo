//
//  TabIcon.swift
//  TabLineAnimation
//
//  Created by Runhua Huang on 9/13/22.
//

import SwiftUI

struct TabIcon: View {
    
    let image: String
    let title: String
    
    init(_ title: String, image systemName: String) {
        self.title = title
        self.image = systemName
    }
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)
            Text(title)
        }
    }
}

struct TabIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabIcon("Today", image: "doc.text.image")
    }
}
