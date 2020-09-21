# Day 32 - Animating bindings

> 将 Stepper 的 value 绑定为 $animationAmount.animation 后，stepper 的值改变，圆在改变时会做动画



```swift
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
```

效果：

<video src="/Users/bugaco/Desktop/Screen Recording 2020-09-11 at 9.23.23 AM.mov"></video>

