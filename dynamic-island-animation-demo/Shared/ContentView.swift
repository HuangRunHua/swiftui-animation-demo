//
//  ContentView.swift
//  Shared
//
//  Created by Runhua Huang on 2022/9/9.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var shapeTransition
    @State private var currentIsland: IslandMode = .none
    @State private var showBatteryInfo: Bool = false
    @State private var showMusicInfo:Bool = false
    @State private var showMusicdetailInfo: Bool = false
    @State private var showMusicScaleDetailInfo: Bool = false
    @State private var buttonDisabled: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                if currentIsland == .none {
                    BackgroundView()
                        .matchedGeometryEffect(id: "island", in: shapeTransition)
                        .overlay {
                            ZStack {
                                DynamicIslandBatteryView()
                                    .opacity(0)
                                    .matchedGeometryEffect(id: "batteryview", in: shapeTransition)
                                MusicView(showScaleView: $showMusicdetailInfo, showMusicdetialInfo: $showMusicScaleDetailInfo)
                                    .opacity(0)
                                    .offset(x: 0, y: self.showMusicScaleDetailInfo ? -50: 0)
                                    .matchedGeometryEffect(id: "musicview", in: shapeTransition)
                            }
                        }
                        .frame(width: 140, height: 40)
                } else if currentIsland == .batteryView {
                    BackgroundView(cornerRadius: 30)
                        .matchedGeometryEffect(id: "island", in: shapeTransition)
                        .overlay {
                            ZStack {
                                DynamicIslandBatteryView()
                                    .opacity(self.showBatteryInfo ? 1: 0)
                                    .matchedGeometryEffect(id: "batteryview", in: shapeTransition)
                                MusicView(showScaleView: $showMusicdetailInfo, showMusicdetialInfo: $showMusicScaleDetailInfo)
                                    .opacity(0)
                                    .offset(x: 0, y: self.showMusicScaleDetailInfo ? -50: 0)
                                    .matchedGeometryEffect(id: "musicview", in: shapeTransition)
                                    
                            }
                        }
                        .frame(width: 350, height: 50)
                } else if currentIsland == .music {
                    BackgroundView()
                        .matchedGeometryEffect(id: "island", in: shapeTransition)
                        .shadow(color: .gray, radius: self.showMusicdetailInfo ? 10: 0, y: self.showMusicdetailInfo ? 10: 0)
                        .overlay {
                            ZStack {
                                DynamicIslandBatteryView()
                                    .opacity(0)
                                    .matchedGeometryEffect(id: "batteryview", in: shapeTransition)
                                MusicView(showScaleView: $showMusicdetailInfo, showMusicdetialInfo: $showMusicScaleDetailInfo)
                                    .opacity(self.showMusicInfo ? 1: 0)
                                    .offset(x: 0, y: self.showMusicScaleDetailInfo ? -50: 0)
                                    .matchedGeometryEffect(id: "musicview", in: shapeTransition)
                            }
                        }
                        .frame(width: self.showMusicScaleDetailInfo ? 360: self.showMusicdetailInfo ? 320: 300, height: self.showMusicScaleDetailInfo ? 210:  self.showMusicdetailInfo ? 90: 60)
                }
                Spacer()
            }
            self.buttons
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var buttons: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                restoreSettings()
            } label: {
                Label("None", systemImage: "camera.metering.none")
            }
            .disabled(self.buttonDisabled)
            
            Button {
                buttonDisabled.toggle()
                withAnimation(.spring(response: 1, dampingFraction: 0.65, blendDuration: 0.01)) {
                    self.currentIsland = .batteryView
                    self.showMusicdetailInfo = false
                    self.showMusicInfo = false
                    self.showMusicScaleDetailInfo = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeInOut) {
                        self.showBatteryInfo = true
                    }
                    buttonDisabled.toggle()
                }
            } label: {
                Label("Battery View", systemImage: "battery.100")
            }
            .disabled(self.buttonDisabled)
            
            Button {
                buttonDisabled.toggle()
                withAnimation(.spring(response: 1, dampingFraction: 0.65, blendDuration: 0.01)) {
                    self.currentIsland = .music
                    self.showBatteryInfo = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeInOut) {
                        self.showMusicInfo = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.spring()) {
                        self.showMusicdetailInfo = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(.spring()) {
                        self.showMusicScaleDetailInfo = true
                    }
                    buttonDisabled.toggle()
                }
            } label: {
                Label("Music View", systemImage: "music.note")
            }
            .disabled(self.buttonDisabled)
        }
    }
}

extension ContentView {
    private func restoreSettings() {
        self.showBatteryInfo = false
        
        self.showMusicScaleDetailInfo = false
        withAnimation(.spring()) {
            self.currentIsland = .none
            self.showMusicdetailInfo = false
            self.showMusicInfo = false
        }
    }
}
