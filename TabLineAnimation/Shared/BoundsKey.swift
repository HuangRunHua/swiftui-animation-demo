//
//  BoundsKey.swift
//  TabLineAnimation
//
//  Created by Runhua Huang on 9/13/22.
//

import SwiftUI

struct BoundsKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        /// value 选用第一个非nil的值
        value = value ?? nextValue()
    }
}
