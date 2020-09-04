# Day 21

## 1、Stacking up buttons

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

## 2、Showing the player's score with an alert

```swift
struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                            flagTapped(number)
                        }) {
                            Image(countries[number])
                                .renderingMode(.original)
                        }
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}
```

效果：现在点击后会根据是否选对，给予提示：
<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 20/assets/image-20200903230128092.png" alt="image-20200903230128092" style="zoom:50%;" />

## 3、Styling our flags

```swift

...
var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
...
...
VStack(spacing: 30) {
                    ForEach(0 ..< 4) {number in
                        Button(action: {
                            flagTapped(number)
                        }) {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                .shadow(color: .black, radius: 2)
                        }
                        
                    }
                }
...	
```

1⃣️背景换成了渐变色，2⃣️给整体按钮增加了圆角、边框、阴影，效果如下：

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 2/Day 21/assets/image-20200904085435213.png" alt="image-20200904085435213" style="zoom:50%;" />



---

答题错了一个

