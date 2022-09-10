//
//  MusicView.swift
//  dynamic-island-animation-demo
//
//  Created by Runhua Huang on 9/10/22.
//

import SwiftUI

struct MusicView: View {
    
    @Namespace private var shapeTransition
    
    @Binding var showScaleView: Bool
    @Binding var showMusicdetialInfo: Bool
    
    var body: some View {
        if showScaleView {
            ZStack {
                HStack(alignment: .top) {
                    HStack {
                        Image("music")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: "albumview", in: shapeTransition)
                            .frame(width: 70, height: 70)
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
                        .matchedGeometryEffect(id: "chartview", in: shapeTransition)
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
                .offset(x: 0, y: 60)
                .opacity(self.showMusicdetialInfo ? 1: 0)
                
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
                .offset(x: 0, y: 110)
                .opacity(self.showMusicdetialInfo ? 1: 0)
                
                Spacer()
            }
            .padding()
        } else {
            ZStack {
                HStack(alignment: .top) {
                    HStack {
                        Image("music")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: "albumview", in: shapeTransition)
                            .frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            Text("Entropy")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Beach Bunny")
                                .foregroundColor(.gray)
                        }
                        .opacity(0)
                    }
                    
                    Spacer()
                        .opacity(0)
                    
                    chartView
                        .matchedGeometryEffect(id: "chartview", in: shapeTransition)
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
                .offset(x: 0, y: 60)
                .hidden()
                
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
                .offset(x: 0, y: 110)
                .hidden()
                
                Spacer()
            }
            .padding()
        }
        
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(showScaleView: .constant(false), showMusicdetialInfo: .constant(false))
            .preferredColorScheme(.dark)
    }
}

extension MusicView {
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
