//
//  ProtonsAndNeutrons.swift
//  Science Calculator
//
//  Created by Luke Drushell on 4/24/22.
//

import SwiftUI

struct ProtonsAndNeutrons: View {
    
    @State var atomicNumber: Int = 1
    @State var mass: Double = 0
    @State var charge: Double = 0
    @FocusState var showKeyboard
    @State var theOutput = ""
    
    @State var protons: Double = 0
    @State var neutrons: Double = 0
    @State var electrons: Double = 0
    
    @State var calcPressed = false
    
    @State var atoms: [Atom] = []
    @State var hovering = false
    
    var body: some View {
        VStack {
            VStack(spacing: -10) {
            textFieldTitle(text: "Atomic Number:")
            TextField("Atomic Number", value: $atomicNumber, format: .number)
               .keyboardType(.numberPad)
                .padding()
                .font(.system(.body, design: .rounded))
                .background(.regularMaterial)
                .cornerRadius(10)
                .focused($showKeyboard)
            }
            if calcPressed {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("State: \(atoms.first?.standardState.localizedCapitalized ?? "Error, no atom")")
                                    //.font(.system(size: 25, weight: .bold, design: .rounded))
                                    .padding(.vertical, 5)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.8)
                            Text("Density: \(String(describing: (atoms.first?.density ?? 0) == 99999.02 ? "Unknown" : "\(atoms.first?.density ?? 0) g/(m^2)"))")
                            //.font(.system(size: 25, weight: .bold, design: .rounded))
                                .padding(.vertical, 5)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            Text("Boiling Point: \(String(describing: (atoms.first?.boilingPoint ?? 0) == 99999.02 ? "Unknown" : "\((atoms.first?.boilingPoint ?? 0))")) Kelvin")
                            //.font(.system(size: 25, weight: .bold, design: .rounded))
                                .padding(.vertical, 5)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            Text("Melting Point: \(String(describing: (atoms.first?.meltingPoint ?? 0) == 99999.02 ? "Unknown" : "\((atoms.first?.meltingPoint ?? 0))")) Kelvin")
                            //.font(.system(size: 25, weight: .bold, design: .rounded))
                                .padding(.vertical, 5)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            }
                            .padding()
                            .background(.regularMaterial)
                            .cornerRadius(10)
                        VStack {
                            HStack {
                                Text("\(String(describing:atoms.first?.atomicNumber ?? 0))")
                                        .font(.system(size: 22, weight: .bold, design: .rounded))
                                        .padding(.top, 8)
                                        .padding(.leading, 8)
                                        //.lineLimit(1)
                                        //.minimumScaleFactor(0.5)
                                Spacer()
                            }
                            Spacer()
                            Text("\(atoms.first?.symbol ?? "Error")")
                                    .font(.system(size: 40, weight: .bold, design: .rounded))
                            Spacer()
                            Text("\(atoms.first?.name ?? "Unknown")")
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                    .padding(8)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.6)
                        }
                        .frame(width: 130, height: 130, alignment: .center)
                        .background(.regularMaterial)
                        .cornerRadius(15)
                    }
                }
            }
//            VStack(spacing: -10) {
//            textFieldTitle(text: "Mass:")
//            TextField("Mass", value: $mass, format: .number)
//               .keyboardType(.decimalPad)
//                .padding()
//                .font(.system(.body, design: .rounded))
//                .background(.regularMaterial)
//                .cornerRadius(10)
//                .focused($showKeyboard)
//            }
            
                Button() {
                    calcPressed = true
                    apiCall().getUserAtoms(number: atomicNumber) { (atoms) in
                        self.atoms = atoms
                    }
                } label: {
                    Text("Calculate")
                        .padding(10)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .padding()
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
            .onAppear(perform: {
                apiCall().getUserAtoms(number: atomicNumber) { (atoms) in
                    self.atoms = atoms
                }
            })
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


struct Atom: Codable, Identifiable {
    
    let id = UUID()
    
    let atomicNumber: Int
    let symbol: String
    let name: String
    //let atomicMass: Double
    //let electronicConfiguration: String
    //let electronegativity: StringOrDouble
    //let atomicRadius: Double
    //let ionRadius: String
    //let vanDerWaalsRadius: Double
    //let ionizationEnergy: Double
    //let electronAffinity: Double
    //let oxidationStates: String
    let standardState: String
    let bondingType: String
    let meltingPoint: Double
    let boilingPoint: Double
    let density: Double
    //let groupBlock: String
    //let yearDiscovered: Int
    //let block: String
    //let cpkHexColor: String
    //let group: Double
    
    
}

struct Atom2: Codable, Identifiable {
    
    let id = UUID()
    
    let atomicNumber: Int
    let symbol: String
    let name: String
    //let atomicMass: Double
    //let electronicConfiguration: String
    //let electronegativity: StringOrDouble
    //let atomicRadius: Double
    //let ionRadius: String
    //let vanDerWaalsRadius: Double
    //let ionizationEnergy: Double
    //let electronAffinity: Double
    //let oxidationStates: String
    let standardState: String
    let bondingType: String
    let meltingPoint: Double
    let boilingPoint: String
    let density: String
    //let groupBlock: String
    //let yearDiscovered: Int
    //let block: String
    //let cpkHexColor: String
    //let group: Double
    
    
}

struct Atom3: Codable, Identifiable {
    
    let id = UUID()
    
    let atomicNumber: Int
    let symbol: String
    let name: String
    //let atomicMass: Double
    //let electronicConfiguration: String
    //let electronegativity: StringOrDouble
    //let atomicRadius: Double
    //let ionRadius: String
    //let vanDerWaalsRadius: Double
    //let ionizationEnergy: Double
    //let electronAffinity: Double
    //let oxidationStates: String
    let standardState: String
    let bondingType: String
    let meltingPoint: String
    let boilingPoint: String
    let density: String
    //let groupBlock: String
    //let yearDiscovered: Int
    //let block: String
    //let cpkHexColor: String
    //let group: Double
    
    
}
