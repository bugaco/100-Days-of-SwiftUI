# Day 32 - Creating explict animations

> 这个3D的动画效果太炫酷了

```swift
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
```

<video src="/Users/bugaco/Desktop/Screen Recording 2020-09-11 at 9.53.19 AM.mov"></video>