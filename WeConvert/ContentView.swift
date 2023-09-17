//
//  ContentView.swift
//  WeConvert
//
//  Created by Ivan Tilev on 17.09.23.
//
// This is a simple app that convers Temperature values from Celsius, Fahrenheit or Kelvin

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var chosenUnit: String = ""
    @State private var userOutput: String = ""
    
    // The temperure metrics that the user can choose from
    let metricValues = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // TextField that take user input
                    TextField("Type a value to convert", text: $userInput)
                        .keyboardType(.numberPad)
                    
                    // Segmented control that the user can choose from what unit to convert from
                    Picker("Conver from: ", selection: $chosenUnit) {
                        ForEach(metricValues, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }
            }.navigationTitle("TempConvert")

        }
        // Segmented control that the user can choose what type of unit to convert to
        // TextView that shows the converted input
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
