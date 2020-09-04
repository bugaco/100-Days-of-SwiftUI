# Project 3

## 1.Why does SwiftUI use structs for views?

> 性能问题，Struct足够简单，不用像UIKit一样，每个控件都要继承自UIView，都要继承UIView用到、用不到的200个属性

## 2.What behind the main SwiftUI view?

> Nothing

## 3.Why modifier order matter

> SwiftUI的机制就是，按照modifier的顺序去生成视图的（简单的这么理解）

## 4.Why does SwiftUI use "some View" for its view type?

> 1⃣️View是一个协议，返回的东西必须遵循View协议
>
> 2⃣️some 关键字修饰一下，表明必须是某种确定类型的View

## 5.Conditional modifiers

> 可以根据不同的条件，展示不同的UI

### 1、三目表达式的方式

```swift
struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            self.useRedText.toggle()            
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}
```

### 2、`if` `else`的方式

```swift
struct ContentView: View {
    @State var useRedText = false
    
    var body: some View {
        if self.useRedText {
                return Text("Hello World")
                    .background(Color.blue)
            } else {
                return Text("Hello World")
                    .background(Color.red)
            }
    }
}
```

> 如果用`if` `else`的方式，if和else返回的必须是同种类型的View，上面的就可以，下面的就不可以：

```swift
struct ContentView: View {
    @State var useRedText = false
    
    var body: some View {
        if self.useRedText {
                return Text("Hello World")
            } else {
                return Text("Hello World")
                    .background(Color.red)
            }
    }
}
```

报错：<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904140808791.png" alt="image-20200904140808791" style="zoom:50%;" />

## 6.Enviroment modifiers

> `Enviroment`modifiers 是相对于`regular` modifiers的，看看这两个例子：

### 1⃣️设置`font`

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("A")
                .font(.largeTitle)
            Text("B")
            Text("C")
            Text("D")
        }
        .font(.body)
    }
}
```

效果：

![image-20200904141956331](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904141956331.png)

### 2⃣️设置`blur`

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("A")
                .blur(radius: 0)
            Text("B")
            Text("C")
            Text("D")
        }
        .blur(radius: 5)
    }
}
```

效果：

![image-20200904142030533](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904142030533.png)

可以看到，Vstack 的 font()的效果被子类的font()替换掉了，而 blur 没有。

总结：

> 能被child view替换掉的，就算是`Enviroment modifiers`，而其他的，就是`regular modifiers`
>
> 我们无法事先知道modifiers是哪种类型的

## 7.Views as properties

> 可以将view声明为属性，这样不但可以代码复用，而且可以使`body`属性更加整洁

```swift
struct ContentView: View {
    let fooText = Text("Foo")
    let barText = Text("Bar")
    var motto: some View {
        return Text("Motto")
    }
    
    var body: some View {
        VStack {
            fooText
                .foregroundColor(.red)
            barText
                .foregroundColor(.blue)
            motto
                .foregroundColor(.yellow)
            motto
                .foregroundColor(.orange)
        }
    }
}
```

![image-20200904143005296](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904143005296.png)

> 注意：不能在 stored properties 中关联 stored properties，但可以在 computed properties 中关联 stored properties

如：

```swift
...
var age = 11
    var motto: some View {
        return Text("Motto\(age)")
}
...
```

## 8.View composition

> 自定义有共同属性的View

```swift

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(Color.orange)
            CapsuleText(text: "Second")
                .foregroundColor(.white)
        }
    }
}

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

```

效果：

![image-20200904150839365](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904150839365.png)

## 9.Custom modifiers

```swift
struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello")
                .titleStyle()
                .watermark()
            Text("Blank View")
                .frame(width: 300, height: 200)
                .background(Color.orange)
                .watermark()
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermark() -> some View {
        self.modifier(Watermark(text: "BugaCo"))
    }
}

struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing, content: {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        })
    }
}
```

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904154845642.png" alt="image-20200904154845642" style="zoom:50%;" />

## 10.Custom containers

> 自定义一个Grid View

```swift
struct ContentView: View {
    
    var body: some View {
        VStack {
            GridStack(rows: 2, columns: 2) { row, column in
                VStack {
                    Image(systemName: "\(row * 2 + column).circle")
                    Text("R\(row) C \(column)")
                }
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
}
```

效果：

![image-20200904172137398](/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Project 3/assets/image-20200904172137398.png)

> 以上已经实现了需求，但如果用 `ViewBuilder`的话，可以更简单一些

如下，添加一个 init 方法：

```swift
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> T) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
```

这样就可以去掉调用时的 HStack 了，直接写成如下的：

```swift
...
GridStack(rows: 2, columns: 2) { row, column in
                Image(systemName: "\(row * 2 + column).circle")
                Text("R\(row) C \(column)")
            }
...
```

用 ViewBuilder 后，`SwiftUI will now automatically create an implicit horizontal stack inside our cell closure`



