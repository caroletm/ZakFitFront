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
    
//    var user: User
    
//    @State var preference : UserPreferences = .none
//    @State var dateDebut : Date = Date()
//    @State var poidsCible : Double? = 55
//    @State var nbDuree : Int? = 12
//    @State var uniteDuree : String? = "semaine"
//    @State var showPicker : Bool = false
//    @State var caloriesParJourString : String = "1500"
//    @State var caloriesParJour : Int? = 1500
//    @State var caloriesBruleesParJourString : String = "1500"
//    @State var caloriesBruleesParJour : Int? = 1500
//    @State var dureeActiviteString : String = "30"
//    @State var dureeActivite : Int? = 30
//    @State var nbEntrainementsHebdoString : String = "3"
//    @State var nbEntrainementsHebdo : Int? = 3
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    VStack (alignment : .leading) {
                        
                        Text("Objectifs nutritionnels")
                            .font(.system(size: 20, weight: .bold))
                        StyledPicker(selection: $userVM.preference, labelFor: { $0.description })
                            .padding(.vertical)
                        
                        HStack {
                            Text("Poids de départ :")
                            Spacer()
                            VStack() {
                                Text("\(userVM.poids) kg")
                                Text(" le \(userVM.dateDebut, style: .date)")
                                    .font(.system(size: 10, weight: .bold))
                            }.font(.system(size: 16, weight: .bold))
                        }
                        .padding(.vertical)
                        
                        HStack {
                            Text("Objectif de poids cible :")
                            Spacer()
                            Picker("Poids", selection: $userVM.poidsCible) {
                                ForEach(30...200, id: \.self) {
                                    Text("\($0) kg")
                                }
                            }.pickerStyle(.automatic)
                        }
                        
                        HStack {
                            Text("Objectif de durée :")
                            Spacer()
                            
                            if userVM.nbDuree != nil && userVM.uniteDuree != nil {
                                Button {
                                    userVM.showPicker = true
                                }label: {
                                    Text("Définir")
                                }
                            }else {
                                Button {
                                    userVM.showPicker = true
                                }label: {
                                    Text("\(userVM.nbDuree ?? 0) \(userVM.uniteDuree ?? "")")
                                }
                            }
                        }
                        .padding(.vertical)
                        
                        HStack {
                            VStack {
                                Text("Objectif calorique quotidien :")
                                Text("Si pas renseigné, l'objectif sera calculé")
                                    .font(.caption)
                            }
                            Spacer()
                            TextField("ex: 1800", text: $userVM.caloriesParJourString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                                .background(Color.orangeLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 80, height: 40)
                                .cornerRadius(10)
                                .onChange(of: userVM.caloriesParJourString) {
                                    userVM.caloriesParJourString = userVM.caloriesParJourString.filter { $0.isNumber }
                                    userVM.caloriesParJour = Int(userVM.caloriesParJourString)
                                }
                        }.padding(.bottom, 10)
                        
                        HStack {
                            VStack {
                                Text("Objectif calorique quotidien à dépenser :")
                                Text("Si pas renseigné, l'objectif sera calculé")
                                    .font(.caption)
                            }
                            Spacer()
                            TextField("ex: 1800", text: $userVM.caloriesBruleesParJourString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                                .background(Color.orangeLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 80, height: 40)
                                .cornerRadius(10)
                                .onChange(of: userVM.caloriesBruleesParJourString) {
                                    userVM.caloriesBruleesParJourString = userVM.caloriesBruleesParJourString.filter { $0.isNumber }
                                    userVM.caloriesBruleesParJour = Int(userVM.caloriesBruleesParJourString)
                                }
                        }.padding(.bottom, 10)
                        
                        Button {
                            navigationVM.path.append(AppRoute.objectifsAvances)
                        }label:{
                            HStack {
                                VStack {
                                    Text("Objectifs nutritionnels avancés :")
                                    Text("Si pas renseignés, l'objectifs seront calculés")
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
                        
                        Text("Objectifs d'activité")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.vertical)
                        
                        HStack {
                            Text("Durée d'activité quotidien (en min): ")
                            Spacer()
                            TextField("ex: 1800", text: $userVM.dureeActiviteString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.greyDark)
                                .background(.greyLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 60, height: 40)
                                .cornerRadius(10)
                                .onChange(of: userVM.dureeActiviteString) {
                                    userVM.dureeActiviteString = userVM.dureeActiviteString.filter { $0.isNumber }
                                    userVM.dureeActivite = Int(userVM.dureeActiviteString)
                                }
                        }
                        
                        HStack {
                            Text("Durée d'entrainements hebdomadaires: ")
                            Spacer()
                            TextField("ex: 1800", text: $userVM.nbEntrainementsHebdoString)
                                .keyboardType(.numberPad)
                                .padding(8)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.greyDark)
                                .background(.greyLight100)
                                .multilineTextAlignment(.center)
                                .frame(width: 60, height: 40)
                                .cornerRadius(10)
                                .onChange(of: userVM.nbEntrainementsHebdoString) {
                                    userVM.nbEntrainementsHebdoString = userVM.nbEntrainementsHebdoString.filter { $0.isNumber }
                                    userVM.nbEntrainementsHebdo = Int(userVM.nbEntrainementsHebdoString)
                                }
                        }.padding(.bottom,10)
                        
                        Divider()
                            .background(Color.accent)
                            .padding(.horizontal, 20)
                    }
                    
                    VStack {
                        Text("Votre objectif de poids est de \(String(format: "%.1f", userVM.poidsCible ?? 0)) kg au 2020020")
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.orangeLight300)
                        Text("*calculs effectués selon le métabolisme basal (BMR)")
                            .font(.system(size: 10, weight: .regular))
                    }
                    
                    
                    HStack {
                        Spacer()
                        BoutonOrange(text: "Valider", width: 115, height: 50) {
                            navigationVM.path = NavigationPath()
                        }
                        
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
                .sheet(isPresented: $userVM.showPicker) {
                    DureePicker(nbDuree: $userVM.nbDuree, uniteDuree: $userVM.uniteDuree, showPicker: $userVM.showPicker)
                        .presentationDetents([.fraction(0.3)])
                }
             
                
            }
        }
    }
}

#Preview {
    Objectifs()
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}
