//
//  ObjectifsAvances.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

struct ObjectifsAvances: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    @State var proteinesString : String = ""
    @State var glucidesString : String = ""
    @State var lipidesString : String = ""
    
    var body: some View {
        
        @Bindable var objectifVM = objectifVM
        
        NavigationView {
            
            VStack {
                
                VStack(alignment: .leading) {
                    Text("Objectifs quotidiens")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Objectif de proteines (g): ")
                            Text("Si pas renseigné, l'objectif sera calculé*")
                                .font(.caption)
                        }
                        Spacer()
                        TextField("\(String(format: "%.1f",objectifVM.proteinesCiblesCalculees()))", text: $proteinesString)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                            .background(.orangeLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .onChange(of: proteinesString) {
                               proteinesString = proteinesString.filter { $0.isNumber }
                                if proteinesString.isEmpty {
                                    objectifVM.proteines = nil
                                } else {
                                    objectifVM.proteines = Double(proteinesString)
                                }
                            }
                    }.padding(.bottom,10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Objectif de glucides (g): ")
                            Text("Si pas renseigné, l'objectif sera calculé*")
                                .font(.caption)
                        }
                        Spacer()
                        TextField("\(String(format: "%.1f", objectifVM.glucidesCiblesCalculees()))", text: $glucidesString)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                            .background(.orangeLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .onChange(of: glucidesString) {
                                glucidesString = glucidesString.filter { $0.isNumber }
                                if glucidesString.isEmpty {
                                    objectifVM.glucides = nil
                                } else {
                                    objectifVM.glucides = Double(glucidesString)
                                }
                            }
                    }.padding(.bottom,10)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Objectif de lipides (g): ")
                            Text("Si pas renseigné, l'objectif sera calculé*")
                                .font(.caption)
                        }
                        Spacer()
                        TextField("\(String(format: "%.1f",objectifVM.lipidesCiblesCalculees()))", text: $lipidesString)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                            .background(.orangeLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .onChange(of: lipidesString) {
                                lipidesString = lipidesString.filter { $0.isNumber }
                                if lipidesString.isEmpty {
                                    objectifVM.lipides = nil
                                } else {
                                    objectifVM.lipides = Double(lipidesString)
                                }
                            }
                    }.padding(.bottom,10)
                }
                .padding()
                
                Text("Votre objectif hebdomadaire est fixé à :\n\(String(format: "%.1f", objectifVM.proteines ?? 0)) g de protéines, \n \(String(format: "%.1f", objectifVM.glucides ?? 0)) g de glucides,\n \(String(format: "%.1f", objectifVM.lipides ?? 0)) g de lipides.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.greyDark)
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Objectifs avancés")
                        .font(.system(size: 24, weight : .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ObjectifsAvances()
        .environment(NavigationViewModel())
        .environment(ObjectifViewModel(userVM: userVM))
}

