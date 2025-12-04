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
    @State var objectifPoidsCibleString : String = ""
    @State var alertObjectifCree : Bool = false
    @FocusState private var isKeyboardActive: Bool
    
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
                            TextField(
                                objectifVM.poidsCible == nil
                                    ? String(format: "%.0f", 0)
                                    : String(format: "%.0f", objectifVM.poidsCible ?? 0),
                                text: $objectifPoidsCibleString
                            )
                            .keyboardType(.numberPad)
                            .focused($isKeyboardActive)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                            .background(Color.orangeLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .onChange(of: objectifPoidsCibleString) {
                                objectifPoidsCibleString = objectifPoidsCibleString.filter { $0.isNumber }
                                if objectifPoidsCibleString.isEmpty {
                                    objectifVM.poidsCible = nil
                                } else {
                                    objectifVM.poidsCible = Double(objectifPoidsCibleString)
                                }
                            }
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
                            TextField(
                                objectifVM.caloriesParJour == nil
                                    ? String(format: "%.0f", objectifVM.caloriesCiblesCalculees())
                                    : String(format: "%.0f", objectifVM.caloriesParJour ?? 0),
                                text: $caloriesParJourString
                            )
                            .keyboardType(.numberPad)
                            .focused($isKeyboardActive)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                            .background(Color.orangeLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 80, height: 40)
                            .cornerRadius(10)
                            .onChange(of: caloriesParJourString) {
                                caloriesParJourString = caloriesParJourString.filter { $0.isNumber }
                                if caloriesParJourString.isEmpty {
                                    objectifVM.caloriesParJour = nil
                                } else {
                                    objectifVM.caloriesParJour = Double(caloriesParJourString)
                                }
                            }
                        }.padding(.vertical)
                        
                        HStack {
                            VStack (alignment :.leading){
                                Text("Objectif calorique quotidien à dépenser :")
                                Text("Si pas renseigné, l'objectif sera calculé*")
                                    .font(.caption)
                            }
                            Spacer()
                            TextField(
                                objectifVM.caloriesBruleesParJour == nil
                                    ? String(format: "%.0f", objectifVM.caloriesCiblesBruleesCalculees())
                                    : String(format: "%.0f", objectifVM.caloriesBruleesParJour ?? 0),
                                text: $caloriesBruleesParJourString
                            )
                            .keyboardType(.numberPad)
                            .focused($isKeyboardActive)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                            .background(Color.orangeLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 80, height: 40)
                            .cornerRadius(10)
                            .onChange(of: caloriesBruleesParJourString) {
                                caloriesBruleesParJourString = caloriesBruleesParJourString.filter { $0.isNumber }
                                if caloriesBruleesParJourString.isEmpty {
                                    objectifVM.caloriesBruleesParJour = nil
                                } else {
                                    objectifVM.caloriesBruleesParJour = Double(caloriesBruleesParJourString)
                                }
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
                            TextField(
                                objectifVM.dureeActivite == nil
                                    ? "30"
                                    : "\(objectifVM.dureeActivite ?? 30)",
                                text: $dureeActiviteString
                            )
                            .keyboardType(.numberPad)
                            .focused($isKeyboardActive)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.greyDark)
                            .background(.greyLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .onChange(of: dureeActiviteString) {
                                dureeActiviteString = dureeActiviteString.filter { $0.isNumber }
                                if dureeActiviteString.isEmpty {
                                    objectifVM.dureeActivite = nil
                                } else {
                                    objectifVM.dureeActivite = Int(dureeActiviteString)
                                }
                            }
                        }
                        
                        HStack {
                            Text("Nombre d'entrainements hebdomadaires: ")
                            Spacer()
                            TextField(
                                objectifVM.nbEntrainementsHebdo == nil
                                    ? "5"
                                    : "\(objectifVM.nbEntrainementsHebdo ?? 5)",
                                text: $nbEntrainementsHebdoString
                            )
                            .keyboardType(.numberPad)
                            .focused($isKeyboardActive)
                            .padding(8)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.greyDark)
                            .background(.greyLight100)
                            .multilineTextAlignment(.center)
                            .frame(width: 60, height: 40)
                            .cornerRadius(10)
                            .onChange(of: nbEntrainementsHebdoString) {
                                nbEntrainementsHebdoString = nbEntrainementsHebdoString.filter { $0.isNumber }
                                if nbEntrainementsHebdoString.isEmpty {
                                    objectifVM.nbEntrainementsHebdo = nil
                                } else {
                                    objectifVM.nbEntrainementsHebdo = Int(nbEntrainementsHebdoString)
                                }
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
                            alertObjectifCree.toggle()
                            navigationVM.path = NavigationPath()
                            print("objectif créé : \(String(describing: objectifVM.lastObjectif))")
                            
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
                .alert("Objectif créé", isPresented: $alertObjectifCree) {
                    Button("OK", role: .cancel) {}
                } message: {
                    VStack{
                        Text("Votre objectif a bien été créé")
                    }
                }
            }
            .onAppear {
                objectifPoidsCibleString = objectifVM.poidsCible != nil
                    ? String(format: "%.0f", objectifVM.poidsCible!)
                    : ""
                caloriesParJourString = objectifVM.caloriesParJour != nil
                    ? String(format: "%.0f", objectifVM.caloriesParJour!)
                    : ""
                caloriesBruleesParJourString = objectifVM.caloriesBruleesParJour != nil
                    ? String(format: "%.0f", objectifVM.caloriesBruleesParJour!)
                    : ""
                dureeActiviteString = objectifVM.dureeActivite != nil
                    ? "\(objectifVM.dureeActivite!)"
                    : ""
                nbEntrainementsHebdoString = objectifVM.nbEntrainementsHebdo != nil
                    ? "\(objectifVM.nbEntrainementsHebdo!)"
                    : ""
            }
            .onTapGesture {
                isKeyboardActive = false
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
