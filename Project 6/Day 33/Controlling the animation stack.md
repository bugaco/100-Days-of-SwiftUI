# Controlling the animation stack

> 动画可以像其他 modify 一样，使用多次，为不同的变化创建不同的动画（包括不做动画，传nil）

```swift
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
```

<video src="/Users/bugaco/Desktop/Screen Recording 2020-09-11 at 10.53.43 AM.mov"></video>

