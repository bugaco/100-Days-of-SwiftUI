# Showing and hiding views with transitions

> 设置transitions后，可以设定动画的过程类型
>
> transition这个词本身的意思有助于理解这一点：`the process or a period of changing from one state or condition to another`

```swift
struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .slide))
            }
        }
    }
}
```



<video src="/Users/bugaco/Desktop/Screen Recording 2020-09-11 at 11.59.31 AM.mov"></video>