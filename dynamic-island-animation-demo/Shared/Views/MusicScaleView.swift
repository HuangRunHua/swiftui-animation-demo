//
//  MusicScaleView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 9/10/22.
//

import SwiftUI

struct MusicScaleView: View {
    var body: some View {
        VStack(spacing: 14) {
            HStack(alignment: .top) {
                HStack {
                    Image("music")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                    VStack(alignment: .leading) {
                        Text("Entropy")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("Beach Bunny")
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                chartView
            }
            
            HStack {
                Text("1:50")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                
                ProgressView(value: 0.5)
                    .progressViewStyle(.linear)
                    .tint(.white)
                    .background(Color.gray)
                
                Text("-1:51")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
            }
            
            HStack {
                Image(systemName: "airplayaudio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .opacity(0)
                Spacer()
                
                HStack(spacing: 50) {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 27)
                    
                    Image(systemName: "forward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                
                Spacer()
                
                Image(systemName: "airplayaudio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
            }
        }
        .padding(21)
    }
}

struct MusicScaleView_Previews: PreviewProvider {
    static var previews: some View {
        MusicScaleView()
            //.preferredColorScheme(.dark)
            .frame(width: 360, height: 190)
            .background(Color.black)
            .cornerRadius(30)
    }
}

extension MusicScaleView {
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
