# Day 25 Consolidation

## 一、Working with ForEach

```swift
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
```

> 在用 ForEach 时，要让SwiftUI知道，怎么区分里边的内容

## 二、Working with bindings

### 1.简单的Bingding

```swift
struct ContentView: View {
    @State var selection = 0
    
    var body: some View {
        let binding = Binding(get: {
            return selection
        }, set: {
            selection = $0
        })
        return VStack {
            Picker("Select a item", selection: binding){
                ForEach(0 ..< 3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
```

效果：

![image-20200905095801887](/Users/bugaco/Library/Application Support/typora-user-images/image-20200905095801887.png)

### 2.复杂一点的

```swift
struct ContentView: View {
    @State var agreeToTerms = false
    @State var agreeToPrivacyPolicy = false
    @State var agreeToEmail = false
    
    var body: some View {
        
        let agreeToAll = Binding(get: {
            return agreeToTerms && agreeToPrivacyPolicy && agreeToEmail
        }, set: {
            agreeToTerms = $0
            agreeToPrivacyPolicy = $0
            agreeToEmail = $0
        })
        
        return Form {
            Toggle("Agree to terms", isOn: $agreeToTerms)
            Toggle("Agree to privacy policy", isOn: $agreeToPrivacyPolicy)
            Toggle("Agree to privacy policy", isOn: $agreeToEmail)
            Toggle("Agree to all", isOn: agreeToAll)
        }
        
    }
}
```

<img src="/Users/bugaco/Library/Application Support/typora-user-images/image-20200905101353793.png" alt="image-20200905101353793" style="zoom: 50%;" />

## 三、Challenge

