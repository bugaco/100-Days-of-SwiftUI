> 其他单位之间的关系不是很清楚，也懒得查资料了，就选了时间转换立项了

效果：

<img src="/Users/bugaco/Code/SwiftUI/100-Days-of-SwiftUI/Days 16-24- Starting SwiftUI/Day 19 - Challenge day/assets/simulator_screenshot_4FE81875-8F97-452F-88B3-B93EACAC81F7.png" alt="simulator_screenshot_4FE81875-8F97-452F-88B3-B93EACAC81F7" style="zoom:50%;" />

代码：

```swift

extension UnitDuration {
    static var days = UnitDuration(symbol: "days", converter: UnitConverterLinear(coefficient: 60 * 60 * 24))
}

struct ContentView: View {
    @State var originDurationValue = ""
    @State var unitInputIndex = 0
    @State var unitOutputIndex = 0
    
    
    var outputValue: Double {
        let originValue = Double(originDurationValue) ?? 0
        
        var unitValueIn = Measurement(value: originValue, unit: getUnit(with: unitInputIndex))
        let unitOut = getUnit(with: unitOutputIndex)
        unitValueIn.convert(to: unitOut)
        return unitValueIn.value
    }
    
    private func getUnit(with index: Int) -> UnitDuration {
        switch index {
        case 0:
            return UnitDuration.seconds
        case 1:
            return UnitDuration.minutes
        case 2:
            return UnitDuration.hours
        default:
            return UnitDuration.days
        }
    }
    
    let units = ["seconds", "minutes", "hours", "days"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Input the origin value")
                        .font(.caption)
                    HStack {
                        
                        TextField("Input the value", text: $originDurationValue)
                            .keyboardType(.decimalPad)
                        Text("\(units[unitInputIndex])".uppercased())
                            .font(.title)
                            .foregroundColor(.orange)
                            .autocapitalization(.allCharacters)
                    }
                }
                Section {
                    Text("Select the input unit")
                        .font(.caption)
                    Picker("Select the input unit", selection: $unitInputIndex) {
                        ForEach(0 ..< units.count) {
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                Section {
                    Text("Select the output unit")
                        .font(.caption)
                    Picker("Select the output unit", selection: $unitOutputIndex) {
                        ForEach(0 ..< units.count) {
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                Section {
                    
                    Text("\(originDurationValue) \(units[1]) is")
                    Text("\(outputValue, specifier: "%.2f") \(units[unitOutputIndex])")
                        .font(.title)
                        .foregroundColor(.green)
                        .autocapitalization(.allCharacters)
                    
                }
            }
            .navigationBarTitle("Duration Conversion")
        }
        
    }
}
```

