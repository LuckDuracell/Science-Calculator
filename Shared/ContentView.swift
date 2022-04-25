//
//  ContentView.swift
//  Shared
//
//  Created by Luke Drushell on 4/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack {
                            NavigationLink(destination: Nucleararator(), label: {
                                listButton(image: "💣", title: "Nuclear Bomb Blast Radius", subtitle: "Includes a Simulator!")
                                    .padding(.top, 5)
                            })
                            Divider()
                        }
                        VStack {
                            NavigationLink(destination: PolyCalc(), label: {
                                listButton(image: "📝", title: "Value of 3D Objects", subtitle: "Now with Spheres too!")
                            })
                            Divider()
                        }
                        VStack {
                            NavigationLink(destination: HalfLife(), label: {
                                listButton(image: "🧪", title: "Half Life", subtitle: "Also works Backwards!")
                            })
                            Divider()
                        }
                        VStack {
                            NavigationLink(destination: LogarithmConverter(), label: {
                                listButton(image: "🔢", title: "Number to Logarithm", subtitle: "Now with a Discovery Graph!")
                            })
                            Divider()
                        }
                        VStack {
                            NavigationLink(destination: Waves(), label: {
                                listButton(image: "🌊", title: "Wavelength and Frequency", subtitle: "And other wave things too?")
                            })
                            Divider()
                        }
                        VStack {
                            NavigationLink(destination: ProtonsAndNeutrons(), label: {
                                listButton(image: "⚛️", title: "Protons & Neutrons", subtitle: "From Atomic Number, Mass, and Charge")
                                    .padding(.bottom, 5)
                            })
                        }
                    }
                    .background(.regularMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.top, 25)
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        Button {
                            guard let urlShare = URL(string: "https://apps.apple.com/us/app/science-calc/id1620799327") else { return }
                                   let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
                            activityVC.title = "Share the app with your friends!"
    
                            UIApplication.shared.windows.first?.rootViewController?
                                .present(activityVC, animated: true, completion: nil)
    
                        } label: {
                            Text("Share App")
                                .padding(.top, 50)
                        }
                    }
                }
            } .navigationTitle("Select a Calculator:")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


struct listButton: View {
    
    let image: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text("\(image)")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text("\(title)")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                Text("\(subtitle)")
                    .font(.caption)
                    .foregroundColor(Color(UIColor.systemGray))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.accentColor)
                .padding(.trailing, 5)
        } .padding()
    }
}
