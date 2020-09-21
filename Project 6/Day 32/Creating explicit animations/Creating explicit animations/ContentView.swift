//
//  ContentView.swift
//  Creating explicit animations
//
//  Created by BugaCo on 2020/9/11.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10, initialVelocity: 0)) {
                self.animationAmount += 360
            }
                     
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 0, y: 1.0, z: 0.0)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
