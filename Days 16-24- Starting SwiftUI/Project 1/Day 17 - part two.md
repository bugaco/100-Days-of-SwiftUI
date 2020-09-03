## 1.Reading text from the user with TextField

```swift
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Section {
                Text("$\(checkAmount)")
            }
        }
    }
}
```

<img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gicl50wogej30u01sxgol.jpg" alt="Simulator Screen Shot - iPhone 11 Pro Max - 2020-09-02 at 20.36.22" style="zoom:25%;" />

## 2.Creating pickers in a form

```swift
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 1000) {
                            Text("\($0) People")
                        }
                    }
                }
                Section {
                    Text("$\(checkAmount)")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}
```

图1

<img src="https://tva1.sinaimg.cn/large/007S8ZIlly1giclttruc4j30u01sxdif.jpg" alt="Simulator Screen Shot - iPhone 11 Pro Max - 2020-09-02 at 21.00.16" style="zoom:25%;" />

图2

![Simulator Screen Shot - iPhone 11 Pro Max - 2020-09-02 at 21.00.23](https://tva1.sinaimg.cn/large/007S8ZIlly1gicltu65szj30u01sxn19.jpg)

## 3.Adding a segmented control for top percentages

```swift
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section {
                    Text("$\(checkAmount)")
                }
                Section {
                    Text("How much tip do you want to leave?")
                    Picker("Tip pencentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

```

<img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gicmlekl0xj30u01sx77g.jpg" alt="Simulator Screen Shot - iPhone 11 Pro Max - 2020-09-02 at 21.26.49" style="zoom:25%;" />

## 4.Calculating the total per person

```swift

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section {
                    Text("How much tip do you want to leave?")
                    Picker("Tip pencentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

```

<img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gicnirf5u2j30u01sxn1j.jpg" alt="Simulator Screen Shot - iPhone 11 Pro Max - 2020-09-02 at 21.58.58" style="zoom:25%;" />

