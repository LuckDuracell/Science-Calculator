//
//  ContentView.swift
//  Shared
//
//  Created by Luke Drushell on 5/25/21.
//

import SwiftUI

struct PolyCalc: View {
    
    let shapes = ["Rectangular Prism", "Cylinder", "Sphere"]
    @State var shape = "Rectangular Prism"
    
    @FocusState var showKeyboard
    @State var len = ""
    @State var hei = ""
    @State var wid = ""
    @State var r = ""
    @State var theOutput = ""
    @State var theOutput2 = ""
    
    var body: some View {
        VStack {
            Picker("Shape", selection: $shape, content: {
                ForEach(shapes, id:\.self, content: { shape in
                    Label(shape, image: shapeIcon(shape: shape))
                })
            })
            .pickerStyle(.wheel)
            .padding()
            VStack {
                if shape == "Rectangular Prism" {
                TextField("Length", text: $len)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
                if shape == "Rectangular Prism" || shape == "Cylinder" {
                TextField("Height", text: $hei)
                    .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
                if shape == "Rectangular Prism" {
                TextField("Width", text: $wid)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
                if shape == "Cylinder" || shape == "Sphere" {
                TextField("Radius", text: $r)
                   .keyboardType(.decimalPad)
                    .padding()
                    .font(.system(.body, design: .rounded))
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    .focused($showKeyboard)
                }
                Button() {
                    if shape == "Rectangular Prism" {
                    let width = Float(wid) ?? Float.zero
                    let length = Float(len) ?? Float.zero
                    let height = Float(hei) ?? Float.zero
                    theOutput = "Volume: " + "\(length * width * height)" + " units^3"
                    //2(wl+hl+hw)
                    theOutput2 = "Surface Area: " + "\(2*((width*length)+(height*length)+(height*width)))" + " units^2"
                    } else if shape == "Cylinder" {
                        let rSquared = pow(Float(r) ?? 0, 2)
                        let height = Float(hei) ?? Float.zero
                        theOutput = "Volume: " + "\(height*3.14*rSquared)" + " units^3"
                        let radiusVal = Float(r) ?? Float.zero
                        theOutput2 = "Surface Area: " + "\((2*3.14*rSquared) + (height*2*3.14*radiusVal))" + " units^2"
                    } else if shape == "Sphere" {
                        let rCubed = pow(Float(r) ?? 0, 3)
                        theOutput = "Volume: " + "\(rCubed*1.3333*3.14)" + " units^3"
                        let rSquared = pow(Float(r) ?? 0, 2)
                        theOutput2 = "Surface Area: " + "\(4*3.14*rSquared)" + " units^2"
                    }
                } label: {
                    Text("Calculate")
                        .padding(10)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .padding()
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
            .padding()
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard, content: {
                    HStack {
                        Spacer()
                        Button { showKeyboard.toggle() } label: { Text("Done") }
                    }
                })
            })
            Spacer()
        }
        .navigationTitle("Volume & Surface Area")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top, -50)
    }
}

struct PolyCalc_Previews: PreviewProvider {
    static var previews: some View {
        PolyCalc()
    }
}

extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}

func shapeIcon(shape: String) -> String {
    var output = ""
    switch shape {
    case "Rectangular Prism":
    output = "rectangle"
    case "Cylinder":
    output = "capsule.portrait"
    case "Sphere":
    output = "circle"
    default:
        output = ""
    }
    return output
}
