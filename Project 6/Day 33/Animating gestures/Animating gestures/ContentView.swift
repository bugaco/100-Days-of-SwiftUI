//
//  ContentView.swift
//  Animating gestures
//
//  Created by BugaCo on 2020/9/11.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enable = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(1)
                    .font(.title)
                    .background(enable ? Color.blue : Color.red)
                    .offset(dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
        DragGesture()
            .onChanged { dragAmount = $0.translation }
            .onEnded({ (_) in
                dragAmount = .zero
                enable.toggle()
            })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
