# Rock Paper Scissors

```swift
struct ContentView: View {
    let moves = ["✊", "✌️", "🖐"]
    @State var score = "0"
    @State var result: Bool?
    @State var showResult = false
    @State var computeChoice = Int.random(in: 0..<2)
    @State var round = 1
    @State var showGameResult = false
    let totalRound = 10
    
    var computerMove: String {
        return moves[computeChoice]
    }
    @State var computeWantWin = Bool.random()
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.orange, .green, .purple, .pink, .red]), center: .center, startRadius: 20, endRadius: 800)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("SCORE \(score)")
                    .font(.title)
                Spacer()
                VStack {
                    Text("I WILL PICK")
                        .font(.title)
                    Text("\(moves[computeChoice])")
                        .font(.system(size: 150))
                    Text(self.computeWantWin ? "Let Me Win!" : "Beata Me!")
                        .font(.title2)
                }
                .alert(isPresented: $showGameResult, content: {
                    Alert(title: Text("Game Over"), message: Text("Your score is \(score)"), dismissButton: .default(Text("OK")){
                        round = 1
                        score = "0"
                    })
                })
                Spacer()
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button(action: {
                            self.judge(move)
                        }){
                            Text(move)
                        }
                    }
                    .font(.system(size: 90))
                }
                .frame(maxWidth: .infinity)
                .alert(isPresented: $showResult, content: {
                    Alert(title: Text(result ?? false ? "You Win" : "You Lose"), message: Text("round : \(round)"), dismissButton: .default(Text("🆗"), action: {
                        print("OK")
                        resetGame()
                    }))
                })
            }
            
        }
    }
    
    func judge(_ move: String) {
        print("the compute choose \(moves[computeChoice]), player should \(computeWantWin ? "win" : "lose"), and the player choose \(move)")
        
        switch computerMove {
        case "✊":
            result = computeWantWin ? (move == "✌️") : (move == "🖐")
        case "✌️":
            result = computeWantWin ? (move == "🖐") : (move == "✊")
        case "🖐":
            result = computeWantWin ? (move == "✊") : (move == "✌️")
        default:
            assert(false)
        }
        var temp = 0
        if result! {
            temp = 1
        } else {
            temp = -1
        }
        let originScore: Int = Int(score) ?? 0
        let newScore = originScore + temp
        score = "\(newScore)"
        
        if round >= totalRound {
            showGameResult = true
        } else {
            showResult = true
        }
    }
    
    func resetGame() {
        round += 1
        computeChoice = Int.random(in: 0..<2)
        computeWantWin = Bool.random()
        result = nil
    }
}
```

Preview:

<img src="/Users/bugaco/Library/Application Support/typora-user-images/image-20200905143921132.png" alt="image-20200905143921132" style="zoom:50%;" />![image-20200905144000115](/Users/bugaco/Library/Application Support/typora-user-images/image-20200905144000115.png)

<img src="/Users/bugaco/Library/Application Support/typora-user-images/image-20200905144043648.png" alt="image-20200905144043648" style="zoom:50%;" />

<img src="/Users/bugaco/Library/Application Support/typora-user-images/image-20200905144142124.png" alt="image-20200905144142124" style="zoom:50%;" />



