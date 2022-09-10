//
//  MusicPeakView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 9/10/22.
//

import SwiftUI

struct MusicPeakView: View {
    var body: some View {
        HStack {
            Image("music")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(7)
            
            Spacer()
            
            chartView
        }
        .padding()
    }
}

struct MusicPeakView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPeakView()
    }
}

extension MusicPeakView {
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
