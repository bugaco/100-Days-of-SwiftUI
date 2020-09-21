# Animating gestures

## 1⃣️卡片的拖拽

> 在拖拽时，直接跟随，拖拽结束后，用动画回到原始位置

```swift
struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 250, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            dragAmount = .zero
                        }
                    }
            )
    }
}
```

<video src="/Users/bugaco/Desktop/Screen Recording 2020-09-11 at 11.20.37 AM.mov"></video>

## 2⃣️Letter数组的拖拽

> 这个效果太炫酷了，我玩了10分钟

```swift
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
```

<video src="/Users/bugaco/Desktop/Screen Recording 2020-09-11 at 11.42.05 AM.mov"></video>

