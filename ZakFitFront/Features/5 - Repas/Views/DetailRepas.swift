//
//  DetailRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct DetailRepas: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    var repas: Repas
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Detail par repas : ")
                        .font(.system(size: 16, weight: .semibold))
                    Text("\(repas.typeRepas.label) du \(repasVM.dateFormatter(repas.date))")
                }
                .padding()
                
   
                ScrollView {
                    
                    ForEach(repas.consos, id: \.id) { conso in
                        
                        VStack  {
                            HStack {
                                Text(conso.aliment.description)
                                Spacer()
                                VStack (alignment: .trailing) {
                                    HStack {
                                        Text("\(conso.quantite)")
                                            .font(.system(size: 16, weight: .bold))
                                        Text(conso.portion.description)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    HStack {
                                        Text("\(String(format: "%.0f", conso.calories))")
                                            .font(.system(size: 10, weight: .bold))
                                        Text("calories")
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                }
                            }.padding(8)
                            
                            Divider()
                                .background(Color.accent)
                                .padding(.horizontal, 20)
                        }
                        .padding(.horizontal)
                    }
                }
               
                
                HStack (spacing: 20) {
                    
                    let macros = repasVM.calculerMacrosTotales(for: repas.consos)

                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 158, height: 117)
                            .foregroundStyle(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                        VStack {
                            Text("Calories estimées")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color.black)
                            Text("\(String(format: "%.0f",macros.calories))")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color.orangeLight300)
                            Text("calories")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color.orangeLight300)
                        }
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 158, height: 117)
                            .foregroundStyle(Color.orangeLight50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.orangeLight300, lineWidth: 1)
                            )
                        
                        VStack (spacing: 5) {
                            Text("Macronutriments")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color.black)
                            Text("Protéines :  \(String(format: "%.1f",macros.proteines))g")
                                .font(.system(size: 12, weight: .regular))
                            Text("Glucides : \(String(format: "%.1f",macros.glucides)) g")
                                .font(.system(size: 12, weight: .regular))
                            Text("Lipides : \(String(format: "%.1f",macros.lipides)) g")
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                }.padding(.bottom,10)
        
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("\(repasVM.dateFormatterLong(repas.date))")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailRepas(repas: repas1)
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
