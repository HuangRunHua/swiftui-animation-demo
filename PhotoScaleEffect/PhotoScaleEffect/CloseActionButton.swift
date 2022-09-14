//
//  CloseActionButton.swift
//  PhotoScaleEffect
//
//  Created by Runhua Huang on 9/14/22.
//

import SwiftUI

struct CloseActionButton: View {
    var label: LocalizedStringKey
    var systemImage: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(Font.title.bold())
                .imageScale(.large)
                .frame(width: 44, height: 44)
                .padding()
                .contentShape(Rectangle())
        }
    }
}
