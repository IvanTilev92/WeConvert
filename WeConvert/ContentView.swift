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
    var result: Double {
        let convertedResult: Double = 0.0
        return convertedResult
    }
    
    // The temperure metrics that the user can choose from
    let metricValues = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // TextField that take user input
                    TextField("Type a value to convert", value: $userInput, format: .number )
                        .keyboardType(.numberPad)
                    
                    // Segmented control that the user can choose from what unit to convert from
                    Text("Convert from:")
                    Picker("Conver from: ", selection: $convertFromUnit) {
                        ForEach(metricValues, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section {
                    // Segmented control that the user can choose what type of unit to convert to
                    Text("Convert to:")
                    Picker("Conver to: ", selection: $convertIntoUnit) {
                        ForEach(metricValues, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    // TextView that shows the converted input
                    Text("\(result)")

                }
            }.navigationTitle("TempConvert")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
