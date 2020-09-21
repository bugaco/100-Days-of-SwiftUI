//
//  ContentView.swift
//  Animating bingdings
//
//  Created by BugaCo on 2020/9/11.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        return VStack {
            
            HStack {
                Stepper("Scale amout", value: $animationAmount.animation(
                    Animation.easeInOut(duration: 0.23)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...10)
            }
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
