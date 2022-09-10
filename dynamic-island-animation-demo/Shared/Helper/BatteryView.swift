//
//  BatteryView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 9/10/22.
//

import SwiftUI

struct BatteryView: View {
    
    private var batteryOverlayColor: Color = Color(red: 0.561, green: 0.561, blue: 0.561, opacity: 1)
    private var batteryColor: Color = Color(red: 0.396, green: 0.769, blue: 0.4, opacity: 1)
    
    var body: some View {
        HStack {
            
            Text("75%")
                .foregroundColor(self.batteryColor)
            HStack(spacing: -5) {
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                         .frame(width: 40, height: 20)
                        .foregroundColor(.gray)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(self.batteryOverlayColor, lineWidth: 5)
                        .background(self.batteryColor)
                        .frame(width: 0.4*85, height: 20)
                        .cornerRadius(5)
                }
                
                Circle()
                    .trim(from: 0, to: 0.4)
                    .rotation(Angle.init(degrees: -72))
                    .foregroundColor(.gray)
                    .frame(width: 10, height: 20)
            }
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryView()
    }
}
