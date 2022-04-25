//
//  Waves.swift
//  Science Calculator
//
//  Created by Luke Drushell on 4/24/22.
//

import SwiftUI

struct Waves: View {
    @State var wavelength: Float = 1
    @State var frequency: Float = 1
    @State var velocity: Float = 1
    @State var output: Float = 1
    
    @State var solveFor = "Wavelength"
    @State var solveFors = ["Wavelength", "Frequency", "Velocity"]
    
    @FocusState var showKeyboard
    @State var calcPressed = false
    
    var body: some View {
        VStack {
            
            Picker("Solve For", selection: $solveFor, content: {
                ForEach(solveFors, id: \.self, content: { item in
                  Text(item)
                })
            })
            .pickerStyle(.segmented)
            .onChange(of: solveFor, perform: { _ in
                calcPressed = false
            })
            
            if solveFor != "Wavelength" {
                VStack(spacing: -10) {
                textFieldTitle(text: "Wavelength:")
                TextField("Wavelength", value: $wavelength, format: .number)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
            }
            if solveFor != "Frequency" {
                VStack(spacing: -10) {
                textFieldTitle(text: "Frequency:")
                TextField("Frequency", value: $frequency, format: .number)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
            }
            if solveFor != "Velocity" {
                VStack(spacing: -10) {
                textFieldTitle(text: "Velocity:")
                TextField("Velocity", value: $velocity, format: .number)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
            }
            
                Button() {
                    switch solveFor {
                    case "Wavelength":
                        output = velocity / frequency
                    case "Frequency":
                        output = velocity / wavelength
                    case "Velocity":
                        output = wavelength * frequency
                    default:
                        print("error")
                    }
                    calcPressed = true
                } label: {
                    Text("Calculate")
                        .padding(10)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .padding()
                }
                
                Spacer()
                
            if calcPressed {
                Text("\(solveFor): \(((output * 1000).rounded() / 1000).formatted())")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
                
                Spacer()
            }
            .padding()
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard, content: {
                    HStack {
                        Spacer()
                        Button { showKeyboard.toggle() } label: { Text("Done") }
                    }
                })
            })
            .navigationTitle("Wavelength & Frequency")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct Waves_Previews: PreviewProvider {
    static var previews: some View {
        Waves()
    }
}
