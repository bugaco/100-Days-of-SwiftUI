//
//  ContentView.swift
//  Guess the Flag
//
//  Created by BugaCo on 2020/9/3.
//  Copyright © 2020 BugaCo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Tap the flag of")
                    .foregroundColor(.white)
                Text(countries[correctAnswer])
                    .foregroundColor(.white)
                VStack(spacing: 30) {
                    ForEach(0 ..< 4) {number in
                        Button(action: {
                            
                        }) {
                            Image(countries[number])
                                .renderingMode(.original)
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone XS Max")
    }
}
