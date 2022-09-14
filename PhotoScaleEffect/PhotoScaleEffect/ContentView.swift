//
//  ContentView.swift
//  PhotoScaleEffect
//
//  Created by Runhua Huang on 9/14/22.
//

import SwiftUI

struct ContentView: View {

    private let threeColumnGrid: [GridItem] = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    
    @State private var currentDetailImageID: FlexibleImage.ID?
    
    @Namespace private var shapeTransition
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ScrollView {
                    LazyVGrid(columns: threeColumnGrid, spacing: 2) {
                        ForEach(FlexibleImage.images.indices, id: \.self) { idx in
                            let presenting = currentDetailImageID ==  FlexibleImage.images[idx].id
                            
                            Button {
                                withAnimation(.spring(response: 0.45, dampingFraction: 0.9)) {
                                    self.currentDetailImageID = FlexibleImage.images[idx].id
                                }
                            } label: {
                                ImageDetailView(image: FlexibleImage.images[idx], displayMode: presenting ? .original: .thumbnail)
                                    .matchedGeometryEffect(id: FlexibleImage.images[idx].id, in: shapeTransition, isSource: !presenting)
                            }
                            .frame(width: geo.size.width/3, height: geo.size.width/3)
                        }
                    }
                    .opacity(self.currentDetailImageID == nil ? 1: 0)
                }
                
                
                if let currentDetailImageID = currentDetailImageID {
                    if let currentImage = FlexibleImage.images.first(where: { $0.id == currentDetailImageID}) {
                        ImageDetailView(image: currentImage, displayMode:  .original)
                            .matchedGeometryEffect(id: currentDetailImageID, in: shapeTransition)
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
                    
                    HStack {
                        Spacer()
                        VStack {
                            CloseActionButton(label: "Close", systemImage: "xmark.circle.fill", action: deselect)
                                .scaleEffect(self.currentDetailImageID != nil ? 1 : 0.5)
                                .opacity(self.currentDetailImageID != nil ? 1 : 0)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Photos")
        }
    }
    
    private func deselect() {
        withAnimation(.linear) {
            self.currentDetailImageID = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}



