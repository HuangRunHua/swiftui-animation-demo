//
//  ContentView.swift
//  AnimatedWindows
//
//  Created by Runhua Huang on 9/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button {
            ChargingView()
                .openInWindow(view: 230, duration: 3, sender: self)
        } label: {
            Text("Show window")
        }
        .frame(width: 400, height: 300)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
