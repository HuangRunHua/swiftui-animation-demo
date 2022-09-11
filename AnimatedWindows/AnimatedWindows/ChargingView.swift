//
//  ChargingView.swift
//  AnimatedWindows
//
//  Created by Runhua Huang on 9/11/22.
//

import SwiftUI

struct ChargingView: View {
    var body: some View {
        HStack(alignment: .top) {
            HStack {
                Image("wind")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading) {
                    Text("起风了")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("买辣椒也用券")
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            chartView
        }
        .padding(10)
        .background(Color.black)
        .cornerRadius(20)
        .frame(width: 230)
    }
}

struct ChargingView_Previews: PreviewProvider {
    static var previews: some View {
        ChargingView()
    }
}

extension ChargingView {
    private var chartView: some View {
        HStack(spacing: 3) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 3, height: 20)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 3, height: 25)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 3, height: 30)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 3, height: 35)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 3, height: 23)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 3, height: 15)
        }
        .foregroundColor(.white)
    }
}
