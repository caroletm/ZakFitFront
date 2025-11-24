//
//  ObjectifsAvances.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

struct ObjectifsAvances: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    @State var proteinesString : String = "100"
    @State var glucidesString : String = "100"
    @State var lipidesString : String = "100"
    @State var proteines : Int? = nil
    @State var glucides : Int? = nil
    @State var lipides : Int? = nil
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack(alignment: .leading) {
                    Text("Objectifs quotidiens")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical)
                    HStack {
                        Text("Objectif de proteines (g): ")
                        Spacer()
                        TextField("proteines", text: $proteinesString)
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
                                proteines = Int(proteinesString) ?? 0
                            }
                    }.padding(.bottom,10)
                    
                    HStack {
                        Text("Objectif de glucides (g): ")
                        Spacer()
                        TextField("glucides", text: $glucidesString)
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
                                glucides = Int(glucidesString) ?? 0
                            }
                    }.padding(.bottom,10)
                    
                    HStack {
                        Text("Objectif de lipides (g): ")
                        Spacer()
                        TextField("proteines", text: $lipidesString)
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
                                lipides = Int(lipidesString) ?? 0
                            }
                    }.padding(.bottom,10)
                }
                .padding()
                
                Text("Votre objectif hebdomadaire est fixé à :\n\(proteines ?? 0) g de protéines, \n \(glucides ?? 0)g de glucides,\n \(lipides ?? 0) g de lipides.")
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
    ObjectifsAvances()
        .environment(NavigationViewModel())
}

