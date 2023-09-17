//
//  ContentView.swift
//  WeConvert
//
//  Created by Ivan Tilev on 17.09.23.
//
// This is a simple app that convers Temperature values from Celsius, Fahrenheit or Kelvin

import SwiftUI

struct ContentView: View {
    @State private var userInput: Double = 0
    @State private var convertFromUnit: String = ""
    @State private var convertIntoUnit: String =  ""
    @FocusState private var keyboardIsFocused: Bool
    
    var result: Double {
        var convertedResult: Double = 0.0
        if convertFromUnit == "Fahrenheit" {
            convertedResult = userInput * 1.8 + 32
        } else if convertFromUnit == "Kelvin" {
            convertedResult = userInput + 273.15
        }
        return convertedResult
    }
    
    // The temperure metrics that the user can choose from
    let metricValues = ["Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Value in °C")
                    // TextField that take user input
                    TextField("Type a value to convert", value: $userInput, format: .number )
                        .keyboardType(.numberPad)
                        .focused($keyboardIsFocused)
                    
                    // Segmented control that the user can choose from what unit to convert from
                    Text("Convert to:")
                    Picker("Conver from: ", selection: $convertFromUnit) {
                        ForEach(metricValues, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    // TextView that shows the converted input
                    Text("Result in \(convertFromUnit):")
                    Text("\(result.formatted(.number))")

                }
            }
            .navigationTitle("TempConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        keyboardIsFocused = false
                        print("Hello")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
