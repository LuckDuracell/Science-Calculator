//
//  Cylinder.swift
//  PolyCalc
//
//  Created by Luke Drushell on 5/25/21.
//

import SwiftUI

struct Cylinder: View {
    
    @State var hei = ""
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
                    
                    TextField("Height", text: $hei)
                        .keyboardType(.decimalPad)
                        .padding()
                        .font(.system(.body, design: .rounded))
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .focused($showKeyboard)
                    
                    Spacer()
                    
                    Button() {
                        
                        let rSquared = pow(Float(r) ?? 1, 2)
                        let height = Float(hei)!
                        
                        theOutput = "V: " + "\(height*3.14*rSquared)" + " units^3"
                        
                        theOutput2 = "SA: " + "\((2*3.14*rSquared) + (height*2*3.14*Float(r)!))" + " units^2"
                        
                    } label: {
                        Text("Calculate")
                        
                    }
                    
                    Spacer()
                    
                    
                    Text(theOutput)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .padding()
                        
                    Text(theOutput2)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                    
                    Spacer()
                    } .padding()
                }
                //.navigationTitle("Cylinder")
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

struct Cylinder_Previews: PreviewProvider {
    static var previews: some View {
        Cylinder()
    }
}

