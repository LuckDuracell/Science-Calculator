//
//  atomViewModel.swift
//  Sci Cal
//
//  Created by Luke Drushell on 4/27/22.
//

import Foundation

class apiCall {
    func getUserAtoms(number: Int, completion:@escaping ([Atom]) -> ()) {
        guard let url = URL(string: "https://periodic-table-elements-info.herokuapp.com/element/atomicNumber/\(number)") else { return }
        //guard let url2 = URL(string: "https://periodic-table-elements-info.herokuapp.com/element/atomicNumber/\(1)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            var atoms: [Atom] = []
            do {
                atoms = try JSONDecoder().decode([Atom].self, from: data!)
            } catch {
                do {
                    let held = try JSONDecoder().decode([Atom2].self, from: data!)
                    atoms = [Atom(atomicNumber: held.first?.atomicNumber ?? 0, symbol: held.first?.symbol ?? "", name: held.first?.name ?? "", standardState: held.first?.standardState ?? "", bondingType: held.first?.bondingType ?? "", meltingPoint: held.first?.meltingPoint ?? 0, boilingPoint: Double(held.first?.boilingPoint ?? "") ?? 0.0, density: Double(held.first?.density ?? "") ?? 0.0)]
                } catch {
                    do {
                        let held = try JSONDecoder().decode([Atom3].self, from: data!)
                        atoms = [Atom(atomicNumber: held.first?.atomicNumber ?? 0, symbol: held.first?.symbol ?? "", name: held.first?.name ?? "", standardState: held.first?.standardState ?? "", bondingType: held.first?.bondingType ?? "", meltingPoint: Double(held.first?.meltingPoint ?? "") ?? 99999.02, boilingPoint: Double(held.first?.boilingPoint ?? "") ?? 99999.02, density: Double(held.first?.density ?? "") ?? 99999.02)]
                    } catch {
                        do {
                            let held = try JSONDecoder().decode([Atom4].self, from: data!)
                            atoms = [Atom(atomicNumber: held.first?.atomicNumber ?? 0, symbol: held.first?.symbol ?? "", name: held.first?.name ?? "", standardState: held.first?.standardState ?? "", bondingType: held.first?.bondingType ?? "", meltingPoint: Double(held.first?.meltingPoint ?? "") ?? 99999.02, boilingPoint: Double(held.first?.boilingPoint ?? 0.0), density: Double(held.first?.density ?? 0.0) )]
                        } catch {
                            print("super big error")
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                completion(atoms)
            }
        }
        .resume()
        
    }
    
    
//    func getUserComments(completion:@escaping ([Comments]) -> ()) {
//            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
//
//            URLSession.shared.dataTask(with: url) { (data, _, _) in
//                let comments = try! JSONDecoder().decode([Comments].self, from: data!)
//                print(comments)
//
//                DispatchQueue.main.async {
//                    completion(comments)
//                }
//            }
//            .resume()
//        }
    
}

//func safeData(url: URL) -> [Atom] {
//    var returnData: [Atom] = [Atom(atomicNumber: 0, symbol: "", name: "", atomicMass: "", electronicConfiguration: "", electronegativity: 0.0, atomicRadius: 0.0, ionRadius: "", vanDerWaalsRadius: 0.0, ionizationEnergy: 0.0, electronAffinity: 0.0, oxidationStates: "", standardState: "", bondingType: "", meltingPoint: 0.0, boilingPoint: 0.0, density: 0.0, groupBlock: "", yearDiscovered: 0, block: "", cpkHexColor: "", period: 0.0, group: 0.0)]
//    URLSession.shared.dataTask(with: url) { (data, _, _) in
//        returnData = try! JSONDecoder().decode([Atom].self, from: data!)
//    }
//    return returnData
//}

