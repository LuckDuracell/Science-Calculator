//
//  Rectangle.swift
//  PolyCalc
//
//  Created by Luke Drushell on 5/25/21.
//

import SwiftUI

struct Rectangle: View {
    
    @FocusState var showKeyboard
    @State var len = ""
    @State var hei = ""
    @State var wid = ""
    @State var theOutput = ""
    @State var theOutput2 = ""
    
    var body: some View {
        ZStack {
            NavigationView() {
                ZStack {
                    VStack {
                        
                        Spacer()
                        
                        TextField("Length", text: $len)
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
                        
                        TextField("Width", text: $wid)
                           .keyboardType(.decimalPad)
                            .padding()
                            .font(.system(.body, design: .rounded))
                            .background(.regularMaterial)
                            .cornerRadius(10)
                            .focused($showKeyboard)
                        
                        Spacer()
                        
                        Button() {
                            let width = Float(wid) ?? Float.zero
                            let length = Float(len) ?? Float.zero
                            let height = Float(hei) ?? Float.zero
                            theOutput = "Volume: " + "\(length * width * height)" + " units^3"
                            
                            //2(wl+hl+hw)
                            theOutput2 = "Surface Area: " + "\(2*((width*length)+(height*length)+(height*width)))" + " units^2"
                            
                        } label: {
                            Text("Calculate")
                            
                        }
                        
                        Spacer()
                        
                        Text(theOutput)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .padding()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text(theOutput2)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        
                        
                        Spacer()
                    }
                }
                //.navigationTitle("Rectangular Prism")
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

struct Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle()
    }
}

