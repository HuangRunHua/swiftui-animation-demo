//
//  DynamicIslandBatteryView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 9/10/22.
//

import SwiftUI

struct DynamicIslandBatteryView: View {
    var body: some View {
        HStack {
            Text("Charging")
                .foregroundColor(.white)
            
            Spacer()
            
            BatteryView()
        }
        .padding()
    }
}

struct DynamicIslandBatteryView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicIslandBatteryView()
    }
}
