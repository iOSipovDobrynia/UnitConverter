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
    
    enum TemperatureUnit {
        case kelvin, celsius, fahrenheit
    }
    
    enum LengthUnit: String, CaseIterable {
        case meter, mile, foot
    }
    
    enum TimeUnit: String, CaseIterable {
        case second, minut, hour
    }
    
    @State private var unit: TimeUnit = .second
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $unit, label: Text("Choose unit type")) {
                        ForEach(Array(TimeUnit.allCases), id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}


#Preview {
    ContentView()
}
