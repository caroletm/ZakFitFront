//
//  ProfilOnboarding.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct ProfilOnboarding: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    @Environment(ObjectifViewModel.self) var objectifVM
    @Environment(AuthViewModel.self) var authVM
    
    @State var showAlert: Bool = false
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Button {
                            //
                        }label:{
                            Image(userVM.image ?? "profilGrey")
                        }
                        Text(userVM.nomUtilisateur)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                        Text(userVM.email)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.greyDark)
                    }
                    Spacer()
                        .frame(height: 40)
                    
                    VStack {
                        HStack {
                            Text("Nom")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            TextField("Nom", text: $userVM.nom)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.greyLight50)
                                .cornerRadius(10)
                                .font(.system(size: 14, weight: .bold))
                                .frame(width: 187)
                            
                        }
                        .padding(.horizontal)
                        HStack {
                            Text("Prénom")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            TextField("Prénom", text: $userVM.prenom)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.greyLight50)
                                .cornerRadius(10)
                                .font(.system(size: 14, weight: .bold))
                                .frame(width: 187)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Taille")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Picker("Taille", selection: $userVM.taille) {
                                ForEach(100...200, id: \.self) {
                                    Text("\($0) cm").tag($0 as Int?)
                                }
                            }.pickerStyle(.automatic)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Poids")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Picker("Poids", selection: $userVM.poids) {
                                ForEach(30...200, id: \.self) { value in
                                    Text("\(value) kg").tag(Double(value) as Double?)
                                }
                            }.pickerStyle(.automatic)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Sexe")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Picker("Sexe", selection: $userVM.sexe) {
                                ForEach(UserGender.allCases, id: \.self) { gender in
                                    Text(gender.description)
                                        .tag(gender)
                                }
                            }.pickerStyle(.automatic)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Date de Naissance")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            
                            Spacer()
                            
                            DatePicker(
                                "",
                                selection: $userVM.dateNaissance,
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.compact)
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        HStack {
                            Text("Age")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            
                            if userVM.age ?? 0 > 0 {
                                Text("\(userVM.age ?? 0) ans")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(Color.orangeLight300)
                            }else {
                                Text("Non renseigné")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(Color.orangeLight300)
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        VStack (alignment: .leading){
                            Text("Préférences alimentaires")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            
                            StyledPicker(selection: $userVM.preference, labelFor: { $0.description })
                                .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .vertical], 10)
                        
                        VStack(alignment: .leading) {
                            Text("Niveau d'activité")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            
                            StyledPicker(selection: $userVM.activityLevel, labelFor: { $0.description })
                                .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .bottom], 10)
                        
                        VStack(alignment: .leading){
                            Text("Objectifs de santé")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            BoutonSouligne (text: "Renseigner mes objectifs", color: .black, fontSize: 16, fontWeight: .bold) {
                                Task {
                                    await authVM.updateProfile()
                                }
                                navigationVM.path.append(AppRoute.objectifs)
                            }
                            .padding(.vertical,5)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .top], 10)
                        
                        BoutonOrange(text: "Valider", width: 115, height: 50) {
                            
                            if authVM.isValidProfile && objectifVM.isValidObjectif {
                                Task {
                                    await authVM.updateProfile()
                                    authVM.isAuthenticated = true
                                    authVM.isFirstConnexion = false
                                }
                           }else{
                               showAlert = true
                           }
                
                        }.padding(5)
                        BoutonSouligne(text: "Annuler", color: .black, fontSize: 16, fontWeight: .bold) {
                            authVM.logout()
                            authVM.firstConnection = false
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear() {
                Task {
                    await authVM.fetchDataUser()
                    if let currentUser = authVM.currentUser {
                           userVM.update(from: currentUser)
                       }
                }
        }
            .alert("Champs manquants", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Vous n'avez pas rempli tous les champs!")
            }
        .navigationBarBackButtonHidden(true)
   
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ProfilOnboarding()
        .environment(NavigationViewModel())
        .environment(userVM)
        .environment(ObjectifViewModel(userVM: userVM))
        .environment(AuthViewModel(userVM: userVM))
}
