//
//  ProtonsAndNeutrons.swift
//  Science Calculator
//
//  Created by Luke Drushell on 4/24/22.
//

import SwiftUI

struct ProtonsAndNeutrons: View {
    
    @State var atomicNumber: Double = 0
    @State var mass: Double = 0
    @State var charge: Double = 0
    @FocusState var showKeyboard
    @State var theOutput = ""
    
    @State var protons: Double = 0
    @State var neutrons: Double = 0
    @State var electrons: Double = 0
    
    @State var calcPressed = false
    
    var body: some View {
        VStack {
            VStack(spacing: -10) {
            textFieldTitle(text: "Atomic Number:")
            TextField("Atomic Number", value: $atomicNumber, format: .number)
               .keyboardType(.decimalPad)
                .padding()
                .font(.system(.body, design: .rounded))
                .background(.regularMaterial)
                .cornerRadius(10)
                .focused($showKeyboard)
            }
            VStack(spacing: -10) {
            textFieldTitle(text: "Mass:")
            TextField("Mass", value: $mass, format: .number)
               .keyboardType(.decimalPad)
                .padding()
                .font(.system(.body, design: .rounded))
                .background(.regularMaterial)
                .cornerRadius(10)
                .focused($showKeyboard)
            }
            
                Button() {
                    protons = atomicNumber
                    neutrons = mass - atomicNumber
                    electrons = atomicNumber
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
                Text("Protons: \(protons.formatted())")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Text("Neutrons: \(neutrons.formatted())")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Text("Electrons: \(electrons.formatted())")
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
            .navigationTitle("Atomic Properties")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

struct ProtonsAndNeutrons_Previews: PreviewProvider {
    static var previews: some View {
        ProtonsAndNeutrons()
    }
}

struct textFieldTitle: View {
    
    let text: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text("\(text)")
                .font(.caption)
                .textCase(.uppercase)
                .foregroundColor(Color(uiColor: .lightGray))
           Spacer()
        } .padding()
    }
}
