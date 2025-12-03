//
//  FiltrerRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI

struct FiltrerRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    var body: some View {
        
        @Bindable var repasVM = repasVM
        
        NavigationView{
            
            VStack{
                
                VStack (alignment :.leading){
                    
                    HStack {
                        Text("Par type :")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    HStack {
                        ForEach(TypeRepas.allCases, id: \.self) { type in
                            Button {
                                
                                if repasVM.selectedRepas == type {
                                    repasVM.selectedRepas = nil
                                }else{
                                    repasVM.selectedRepas = type
                                }
                                
                            }label: {
                                Text(type.label)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundStyle(repasVM.selectedRepas == type ? Color.white : Color.orangeLight300)
                                    .padding(8)
                                    .background(repasVM.selectedRepas == type ? Color.orangeLight300 : Color.orangeLight100)
                                
                                    .cornerRadius(10)
                                    .padding(5)
                            }
                        }
                    }
                    
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                
                VStack {
                    HStack{
                        Text("Par calories :")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                        
                        Text("\(Int(repasVM.minCalories))")
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(Color.orangeLight100)
                            .cornerRadius(10)
                            .foregroundStyle(Color.orangeLight300)
                        
                        
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                    
                    Slider(value: $repasVM.minCalories, in: 0...5000)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 10, trailing: 50))
                }
                FiltreParNomAliment()
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
                
                if repasVM.isFilterActive {
                    Button {
                        repasVM.resetFilter()
                    }label:{
                        Text("Vider les filtres")
                    }
                }
                Spacer()
                
                BoutonOrange(text: "Valider", width: 115, height: 50) {
                    navigationVM.path.removeLast(1)
                }.padding(.bottom,5)
                
                BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {
                    repasVM.resetFilter()
                }
                
            }
            .padding(.top, 40)
            .toolbar {
                ToolbarItem (placement: .principal) {
                    Text("Filtrer mes repas")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await repasVM.fetchRepas()
                    await repasVM.fetchConsos()
                    await repasVM.fetchAliments()
                }
            }
        }
    }
}

#Preview {
    FiltrerRepas()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}

