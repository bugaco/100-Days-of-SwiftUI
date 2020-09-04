//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by BugaCo on 2020/9/4.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            GridStack(rows: 2, columns: 2) { row, column in
                Image(systemName: "\(row * 2 + column).circle")
                Text("R\(row) C \(column)")
            }
            
        }
    }
}

struct GridStack<T: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> T
    
    var body: some View {
        VStack {
            ForEach(0..<rows) { row in
                HStack {
                    ForEach(0..<columns) { column in
                        content(row, column)
                            .padding()
                            .background(Color.yellow)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> T) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
