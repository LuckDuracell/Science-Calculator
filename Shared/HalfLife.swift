//
//  HalfLife.swift
//  Science Calculator
//
//  Created by Luke Drushell on 4/24/22.
//

import SwiftUI

struct HalfLife: View {
    
    @State var initialAmount: Float = 1
    @State var timeElapsed: Float = 0
    @State var halfLife: Float = 1
    @State var amountRemaining: Float = 1
    
    @State var lessThan: Float = 0.5
    @State var iterations: Float = 0
    
    @State var solveFor = "Amount"
    @State var solveFors = ["Amount", "Time"]
    
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
            
            VStack(spacing: -10) {
            textFieldTitle(text: "Initial Amount:")
            TextField("Initial Amount", value: $initialAmount, format: .number)
               .keyboardType(.decimalPad)
                .padding()
                .font(.system(.body, design: .rounded))
                .background(.regularMaterial)
                .cornerRadius(10)
                .focused($showKeyboard)
            }
            
            if solveFor == "Amount" {
                VStack(spacing: -10) {
                textFieldTitle(text: "Time Elapsed:")
                TextField("Time Elapsed", value: $timeElapsed, format: .number)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
            }
            VStack(spacing: -10) {
            textFieldTitle(text: "Half Life:")
            TextField("Half Life", value: $halfLife, format: .number)
               .keyboardType(.decimalPad)
                .padding()
                .font(.system(.body, design: .rounded))
                .background(.regularMaterial)
                .cornerRadius(10)
                .focused($showKeyboard)
            }
            if solveFor == "Time" {
                VStack(spacing: -10) {
                textFieldTitle(text: "When Quantitiy Reaches:")
                TextField("When Quantitiy Reaches", value: $lessThan, format: .number)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
            }
            
                Button() {
                    if solveFor == "Amount" {
                        amountRemaining = initialAmount * (pow(0.5, (timeElapsed / halfLife)))
                    } else {
                        let timeOverTime = log((lessThan / initialAmount)) / log(0.5)
                        iterations = timeOverTime * halfLife
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
                if solveFor == "Amount" {
                    Text("Amount Remaining: \(amountRemaining.formatted())")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .padding()
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                } else {
                    Text("Time Until Value: \(iterations.formatted())")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .padding()
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
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
            .navigationTitle("Half Life")
            .navigationBarTitleDisplayMode(.inline)
        }
}

struct HalfLife_Previews: PreviewProvider {
    static var previews: some View {
        HalfLife()
    }
}
