//
//  Sphere.swift
//  PolyCalc
//
//  Created by Luke Drushell on 5/25/21.
//

import SwiftUI

struct Sphere: View {
    
    @State var r = ""
    @State var theOutput = ""
    @State var theOutput2 = ""
    @FocusState var showKeyboard
    
    var body: some View {
        ZStack {
            NavigationView() {
                ZStack {
                    VStack {
                    Spacer()
                    
                    TextField("r", text: $r)
                        .keyboardType(.decimalPad)
                        .padding()
                        .font(.system(.body, design: .rounded))
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .focused($showKeyboard)
                        
                    Spacer()
                    
                    Button() {
                        
                        let rCubed = pow(Float(r) ?? 0, 3)
                        
                        
                        theOutput = "Volume: " + "\(rCubed*1.3333*3.14)" + " units^3"
                        
                        let rSquared = pow(Float(r) ?? 0, 2)
                        
                        theOutput2 = "Surface Area: " + "\(4*3.14*rSquared)" + " units^2"
                        
                        
                    } label: {
                        Text("Calculate")
                        
                    }
                    
                    Spacer()
                    
                        Text(theOutput)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .padding()
                        Text(theOutput2)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            
                    
                    
                    Spacer()
                    }
                }
                //.navigationTitle("Sphere")
                .padding()
                .toolbar(content: {
                    ToolbarItemGroup(placement: .keyboard, content: {
                        HStack {
                            Spacer()
                            Button { showKeyboard.toggle() } label: { Text("Done") }
                        }
                    })
                })
            }
        }
    }
}

struct Sphere_Previews: PreviewProvider {
    static var previews: some View {
        Sphere()
    }
}

