//
//  ContentView.swift
//  Controlling the animation stack
//
//  Created by BugaCo on 2020/9/11.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    var body: some View {
        Button("Tap Me") {
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enable ? Color.red : Color.blue).animation(.default)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
