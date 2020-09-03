//
//  ContentView.swift
//  DurationUnit Conversion
//
//  Created by BugaCo on 2020/9/3.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
