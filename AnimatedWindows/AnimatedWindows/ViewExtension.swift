//
//  ViewExtension.swift
//  AnimatedWindows
//
//  Created by Runhua Huang on 9/11/22.
//

import SwiftUI

extension View {
    @discardableResult
    func openInWindow(view width:CGFloat, duration: CGFloat, sender: Any?) -> NSWindow? {
            if let screenWidth = NSScreen.main?.frame.size.width, let screenHeight = NSScreen.main?.frame.size.height {

                let controller = NSHostingController(rootView: self)
                let win = NSWindow(contentViewController: controller)
                win.titlebarAppearsTransparent = true
                win.makeKeyAndOrderFront(sender)
                win.backgroundColor = .clear
                win.animationBehavior = .none
                win.styleMask.remove(.titled)
                /// Set the original position of window.
                win.setFrameOrigin(CGPoint(x: screenWidth/2 - width/2, y: screenHeight))
                /// 此处设置width与height只影响window的大小
                /// 在前面已经设置backgroundColor为clear故对视图没有影响。
                win.animator().setFrame(CGRect(x: screenWidth/2 - width/2, y: screenHeight-100, width: 300, height: 10), display: true, animate: true)

                /// After 3 seconds, move the window outside windows automatically.
                /// If the y set too large, the animation will become wired.
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    win.animator().setFrame(CGRect(x: screenWidth/2 - width/2, y: screenHeight + 100, width: 300, height: 10), display: true, animate: true)
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.2) {
                    win.close()
                }

                return win
            }
            return nil
        }
}

