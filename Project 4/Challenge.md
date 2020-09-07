> 在之前的基础上，做了些优化。
>
> 现在，不用手动点击“计算”按钮，而是实时计算bedtime

```swift
struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    
    let model = SleepCalculator()
    @State private var coffeeAmountIndex = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    private var bedtime: String {
        var msg = ""
        let componets = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (componets.hour ?? 0) * 60 * 60
        let minute = (componets.minute ?? 0) * 60
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmountIndex + 1))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            msg = formatter.string(from: sleepTime)
        } catch {
            msg = "Error"
        }
        return msg
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper(value: $sleepAmount, in: 4 ... 12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Picker("Daily coffee intake", selection: $coffeeAmountIndex) {
                        ForEach(1 ..< 20) {number in
                            Text("\(number) cups")
                        }
                    }
                }
                Section {
                    Text("Recommended bedtime:")
                        .font(.headline)
                    Text("\(bedtime)")
                        .font(.largeTitle)
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
}
```

预览图：

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Project 4/assets/image-20200907150103583.png" alt="image-20200907150103583" style="zoom:50%;" />