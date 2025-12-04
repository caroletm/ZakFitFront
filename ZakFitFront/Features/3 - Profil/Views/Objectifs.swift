//
//  Objectifs.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Objectifs : View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    @Environment(ObjectifViewModel.self) var objectifVM

    @State var caloriesParJourString : String = ""
    @State var caloriesBruleesParJourString : String = ""
    @State var dureeActiviteString : String = ""
    @State var nbEntrainementsHebdoString : String = ""
    
    var body: some View {
        
        @Bindable var userVM = userVM
        @Bindable var objectifVM = objectifVM
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    VStack (alignment : .leading) {
                        
                        Text("Objectifs nutritionnels")
                            .font(.system(size: 20, weight: .bold))
                        StyledPicker(selection: $objectifVM.objectifGlobal, labelFor: { $0.description })
                            .padding(.vertical)
                        
                        HStack {
                            Text("Poids de départ :")
                            Spacer()
                            VStack() {
                                Text("\(String(format: "%.1f", userVM.poids ?? 0)) kg")
                                Text("\(userVM.dateFormatter(objectifVM.dateDebut))")
                                    .font(.system(size: 10, weight: .bold))
                            }.font(.system(size: 16, weight: .bold))
                        }
                        .padding(.vertical)
                        
                        HStack {
                            Text("Objectif de poids cible :")
                            Spacer()
                            Picker("Poids", selection: $objectifVM.poidsCible) {
                                ForEach(40...200, id: \.self) { value in
                                    Text("\(value) kg").tag(Double(value) as Double?)
                                }
                            }.pickerStyle(.automatic)
                        }
                        
                        HStack {
                            Text("Objectif de durée :")
                            Spacer()
                            
                            Button {
                                   objectifVM.showPicker = true
                               } label: {
                                   if objectifVM.nbDuree == nil || objectifVM.uniteDuree == nil {
                                       Text("Définir")
                                   } else {
                                       Text("\(objectifVM.nbDuree!) \(objectifVM.uniteDuree!)")
                                   }
                               }
                           }
                           .padding(.vertical)
                        
                        HStack {
                            VStack(alignment :.leading) {
                                Text("Objectif calorique quotidien :")
                                Text("Si pas renseigné, l'objectif sera calculé*")
                                    .font(.caption)
                            }
                            Spacer()
                            TextField("\(String(format: "%.0f", objectifVM.caloriesCiblesCalculees()))", text: $caloriesParJourString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                                .background(Color.orangeLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 80, height: 40)
                                .cornerRadius(10)
                                .onChange(of: caloriesParJourString) {
                                    caloriesParJourString = caloriesParJourString.filter { $0.isNumber }
                                    objectifVM.caloriesParJour = Double(caloriesParJourString)
                                }
                        }.padding(.vertical)
                        
                        HStack {
                            VStack (alignment :.leading){
                                Text("Objectif calorique quotidien à dépenser :")
                                Text("Si pas renseigné, l'objectif sera calculé*")
                                    .font(.caption)
                            }
                            Spacer()
                            TextField("\(String(format: "%.0f", objectifVM.caloriesCiblesBruleesCalculees()))", text: $caloriesBruleesParJourString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                                .background(Color.orangeLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 80, height: 40)
                                .cornerRadius(10)
                                .onChange(of: caloriesBruleesParJourString) {
                                    caloriesBruleesParJourString = caloriesBruleesParJourString.filter { $0.isNumber }
                                    objectifVM.caloriesBruleesParJour = Double(caloriesBruleesParJourString)
                                }
                        }.padding(.vertical)
                        
                        Button {
                            navigationVM.path.append(AppRoute.objectifsAvances)
                        }label:{
                            HStack {
                                VStack(alignment :.leading) {
                                    Text("Objectifs nutritionnels avancés :")
                                    Text("Si pas renseignés, les objectifs seront calculés*")
                                        .font(.caption)
                                }
                                .foregroundStyle(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.orangeLight300)
                            }
                        }.padding(.vertical)
                        
                        Divider()
                            .background(Color.accent)
                            .padding(.horizontal, 20)
                            .padding(.vertical)
                        
                        Text("Objectifs d'activité")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.vertical)
                        
                        HStack {
                            
                            VStack(alignment :.leading) {
                                Text("Durée d'activité quotidien (en min):")
                                Text("Si pas renseigné, l'objectif de base sera renseigné")
                                    .font(.caption)
                            }
                            Spacer()
                            TextField("\(objectifVM.dureeActivite ?? 30)", text: $dureeActiviteString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.greyDark)
                                .background(.greyLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 60, height: 40)
                                .cornerRadius(10)
                                .onChange(of: dureeActiviteString) {
                                    dureeActiviteString = dureeActiviteString.filter { $0.isNumber }
                                    objectifVM.dureeActivite = Int(dureeActiviteString)
                                }
                        }
                        
                        HStack {
                            Text("Nombre d'entrainements hebdomadaires: ")
                            Spacer()
                            TextField("\(objectifVM.nbEntrainementsHebdo ?? 5)", text: $nbEntrainementsHebdoString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.greyDark)
                                .background(.greyLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 60, height: 40)
                                .cornerRadius(10)
                                .onChange(of: nbEntrainementsHebdoString) {
                                    nbEntrainementsHebdoString = nbEntrainementsHebdoString.filter { $0.isNumber }
                                    objectifVM.nbEntrainementsHebdo = Int(nbEntrainementsHebdoString)
                                }
                        }.padding(.vertical)
                        
                        Divider()
                            .background(Color.accent)
                            .padding(.horizontal, 20)
                            .padding(.vertical)
                    }
                    
                    VStack {
                        if objectifVM.poidsCible != nil  || objectifVM.nbDuree != nil {
                            Text("Votre objectif de poids est de \(String(format: "%.1f", objectifVM.poidsCible ?? 0)) kg au \(userVM.dateFormatter(objectifVM.dateCible() ?? Date()))")
                                .font(.system(size: 16, weight: .bold))
                                .padding()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.orangeLight300)
                        }else {
                            Text("Votre objectif de poids est de \(String(format: "%.1f", userVM.poids ?? 0)) kg")
                                .font(.system(size: 16, weight: .bold))
                                .padding()
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.orangeLight300)
                        }
                       
                        Text("*calculs effectués selon le métabolisme basal (BMR)")
                            .font(.system(size: 10, weight: .regular))
                    }
                    
                    HStack {
                        Spacer()
                        BoutonOrange(text: "Valider", width: 115, height: 50) {
                            Task {
                                await objectifVM.createObjectif()
                            }
                            navigationVM.path = NavigationPath()
                        }.padding()
                        
                        Spacer()
                    }
                    
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement : .principal) {
                        Text("Mes objectifs")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .sheet(isPresented: $objectifVM.showPicker) {
                    DureePicker(showPicker: $objectifVM.showPicker)
                        .presentationDetents([.fraction(0.3)])
                }
            }
            .onAppear() {
                Task {
                    await objectifVM.fetchAllObjectifs()
                }
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    Objectifs()
        .environment(NavigationViewModel())
        .environment(userVM)
        .environment(ObjectifViewModel(userVM: userVM))
}
