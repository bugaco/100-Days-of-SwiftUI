## 1、Gradients

```swift
struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.5, green: 0.8, blue: 0)
                .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.yellow, .orange, .red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            RadialGradient(gradient: Gradient(colors: [.purple, .gray]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 20, endRadius: 500)
            AngularGradient(gradient: Gradient(colors: [.yellow, .green, .orange, .red, .blue ]), center: .center)
            Text("Your content")
                .frame(width: 300, height: 300, alignment: .center)
                .background(RadialGradient(gradient: Gradient(colors: [.purple, .secondary]), center: .center, startRadius: 20, endRadius: 150))
                .cornerRadius(150)
        }
        .background(Color.red)
    }
}
```

效果：

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/simulator_screenshot_481F6CE5-F529-4AED-AFE8-0F1530F70814.png" alt="simulator_screenshot_481F6CE5-F529-4AED-AFE8-0F1530F70814" style="zoom:50%;" />

> 就像打开了新世界的大门，这么炫酷的效果，写起来简单容易

## 2、Buttons and Images

```swift
struct ContentView: View {
    var body: some View {
        Button(action: {
            print("button tapped.")
        }) {
            VStack(spacing: 20) {
                Image(systemName: "pencil")
                    .renderingMode(.original)
                Text("edit").foregroundColor(.red)
            }
        }
    }
}
```

效果：

![image-20200903162942434](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/image-20200903162942434.png)

> 自定义Button终于比较灵活了，比UIKit的好用

## 3、Showing alert messages

Code:

```swift
struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert"){
            showingAlert = true
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Hello SWiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        })
    }
}
```

1.点击前：

![image-20200903170732897](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/image-20200903170732897.png)

2.点击后：

![image-20200903170744528](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/image-20200903170744528.png)

3.点击“OK”后，恢复初始状态：

![image-20200903170732897](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/image-20200903170732897.png)

## 4、Stacking up buttons

> Button、Image的堆叠，没有特别之处

```swift
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
```

效果：

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/image-20200903173608165.png" alt="image-20200903173608165" style="zoom: 67%;" />

