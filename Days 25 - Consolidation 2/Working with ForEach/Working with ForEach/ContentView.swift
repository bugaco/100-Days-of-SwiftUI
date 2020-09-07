//
//  ContentView.swift
//  Working with ForEach
//
//  Created by BugaCo on 2020/9/5.
//

import SwiftUI

struct ContentView: View {
    var names = ["李洛克", "兜", "角都"]
    var body: some View {
        List {
            ForEach(0 ..< 20) {
                Text("row\($0)")
            }
            
            ForEach(names, id: \.self) {
                Text("name \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
