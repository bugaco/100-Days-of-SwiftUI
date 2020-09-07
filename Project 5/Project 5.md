## Introducing List, your best friend


> 用List来实现动、静结合的列表

```swift
struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List {
            ForEach(people, id: \.self) {
                Text("\($0)")
            }
            Text("Foo")
        }
    }
}
```

## Loading resources from your app bundle

> 将bundle中的txt文件，读取为String类型

```swift
if let fileUrl = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileUrl) {
                
            }
        }
```

## Working with strings

> 单词拼写检查

```swift
let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
```

## Adding to a list of words

> 我觉得SwiftUI很棒的地方，就是可以用很简单的代码，写出来颜值很高的app

```swift

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text("\($0)")
                }
            }
            .navigationBarTitle(rootWord)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            return
        }
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
}
```

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Project 5/assets/image-20200907173813120.png" alt="image-20200907173813120" style="zoom:50%;" />

## Running code when our app launches

> 从start.txt文件读取words，随机一个作为rootWord

```swift
struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text("\($0)")
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
        }
        
    }
    
    func startGame() {
        if let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: fileUrl) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {
            return
        }
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
}
```

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Project 5/assets/image-20200907175238306.png" alt="image-20200907175238306" style="zoom:50%;" />

## Validating words with UITextChecker

