//
//  ContentView.swift
//  Shared
//
//  Created by Runhua Huang on 9/13/22.
//

import SwiftUI

struct ContentView: View {
    
    private let tabs: [TabIcon] = [
        TabIcon("Today", image: "doc.text.image"),
        TabIcon("Games", image: "tram.fill.tunnel"),
        TabIcon("Apps", image: "square.stack.3d.up.fill"),
        TabIcon("Search", image: "magnifyingglass")
    ]
    
    @State private var selectedTabIndex = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .bottom) {
                ForEach(tabs.indices, id: \.self) { tabIndex in
                    Spacer()
                    Button {
                        withAnimation(.default) {
                            self.selectedTabIndex = tabIndex
                        }
                    } label: {
                        self.tabs[tabIndex]
                    }
                    .foregroundColor(self.selectedTabIndex == tabIndex ? .accentColor: .gray)
                    .anchorPreference(key: BoundsKey.self, value: .bounds) { anchor in
                        self.selectedTabIndex == tabIndex ? anchor: nil
                    }
                    Spacer()
                }
            }
            .padding([.top])
            .overlayPreferenceValue(BoundsKey.self) { anchor in
                GeometryReader { proxy in
                    Rectangle()
                        .fill(.gray)
                        .frame(width: proxy.size.width, height: 0.5, alignment: .topLeading)
                }
            }
            .overlayPreferenceValue(BoundsKey.self) { anchor in
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.accentColor)
                        .frame(width: proxy[anchor!].width, height: 5)
                        .offset(x: proxy[anchor!].minX)
                        .frame(width: proxy.size.width, height: proxy.size.height, alignment: .topLeading)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
