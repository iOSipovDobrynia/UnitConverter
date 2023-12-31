//
//  ContentView.swift
//  UnitConverter
//
//  Created by Goodwasp on 07.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    enum Unit: String, CaseIterable {
        case temperature, length, time
    }
    
    @State private var unitType: Unit = .length
    
    private var units: [String] {
        switch unitType {
        case .temperature:
            ["kelvin", "celsius", "fahrenheit"]
        case .length:
            ["meter", "mile", "foot"]
        case .time:
            ["second", "minute", "hour"]
        }
    }
    
    @State private var unitFrom = ""
    @State private var unitTo = ""
    
    @State private var currentValue = 0.0
    
    private var resultValue: Double {
        var result = 0.0
        switch unitType {
        case .temperature:
            result = convertTemperature()
        case .length:
            result = convertLength()
        case .time:
            result = convertTime()
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $unitType, label: Text("Choose unit type")) {
                        ForEach(Array(Unit.allCases), id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Section {
                    Picker(selection: $unitFrom, label: Text("Unit from")) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Title", value: $currentValue, format: .number)
                    .keyboardType(.decimalPad)
                } header: {
                    Text("Unit from")
                }
                
                Section {
                    Picker(selection: $unitTo, label: Text("Unit to")) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Unit to")
                }
                
                Section {
                    Text("\(resultValue)")
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
    
    private func convertTemperature() -> Double {
        var result = 0.0
        switch unitFrom {
        case "kelvin":
            result = convertFromKelvin()
        case "celsius":
            result = convertFromCelsius()
        case "fahrenheit":
            result = convertFromFahrenheit()
        default:
            break
        }
        
        return result
    }
    
    private func convertFromKelvin() -> Double {
        var result = 0.0
        switch unitTo {
        case "kelvin":
            result = currentValue
        case "celsius":
            result = currentValue - 273.15
        case "fahrenheit":
            result = (currentValue - 273.15) * 9/5 + 32
        default:
            break
        }
        return result
    }
    
    private func convertFromCelsius() -> Double {
        var result = 0.0
        switch unitTo {
        case "kelvin":
            result = currentValue + 273.15
        case "celsius":
            result = currentValue
        case "fahrenheit":
            result = currentValue * 9/5 + 32
        default:
            break
        }
        return result
    }
    
    private func convertFromFahrenheit() -> Double {
        var result = 0.0
        switch unitTo {
        case "kelvin":
            result = (currentValue - 32) * 5/9 + 273.15
        case "celsius":
            result = (currentValue - 32) * 5/9
        case "fahrenheit":
            result = currentValue
        default:
            break
        }
        return result
    }
    
    private func convertTime() -> Double {
        var result = 0.0
        switch unitFrom {
        case "second":
            result = convertFromSecond()
        case "minute":
            result = convertFromMinute()
        case "hour":
            result = convertFromHour()
        default:
            break
        }
        
        return result
    }
    
    private func convertFromSecond() -> Double {
        var result = 0.0
        switch unitTo {
        case "second":
            result = currentValue
        case "minute":
            result = currentValue / 60
        case "hour":
            result = currentValue / 3600
        default:
            break
        }
        return result
    }
    
    private func convertFromMinute() -> Double {
        var result = 0.0
        switch unitTo {
        case "second":
            result = currentValue * 60
        case "minute":
            result = currentValue
        case "hour":
            result = currentValue / 60
        default:
            break
        }
        return result
    }
    
    private func convertFromHour() -> Double {
        var result = 0.0
        switch unitTo {
        case "second":
            result = currentValue * 3600
        case "minute":
            result = currentValue * 60
        case "hour":
            result = currentValue
        default:
            break
        }
        return result
    }

    
    private func convertLength() -> Double {
        var result = 0.0
        switch unitFrom {
        case "meter":
            result = convertFromMeter()
        case "mile":
            result = convertFromMile()
        case "foot":
            result = convertFromFoot()
        default:
            break
        }
        
        return result
    }
    
    private func convertFromMeter() -> Double {
        var result = 0.0
        switch unitTo {
        case "meter":
            result = currentValue
        case "mile":
            result = currentValue / 1609.34
        case "foot":
            result = currentValue / 0.3048
        default:
            break
        }
        return result
    }
    
    private func convertFromMile() -> Double {
        var result = 0.0
        switch unitTo {
        case "meter":
            result = currentValue * 1609.34
        case "mile":
            result = currentValue
        case "foot":
            result = currentValue * 5280
        default:
            break
        }
        return result
    }
    
    private func convertFromFoot() -> Double {
        var result = 0.0
        switch unitTo {
        case "meter":
            result = currentValue * 0.3048
        case "mile":
            result = currentValue / 5280
        case "foot":
            result = currentValue
        default:
            break
        }
        return result
    }

}


#Preview {
    ContentView()
}
