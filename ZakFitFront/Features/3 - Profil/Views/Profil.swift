//
//  Profil.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Profil: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        NavigationView {
            ScrollView{
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
                            Text("\(userVM.nom)")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        HStack {
                            Text("Prénom")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Text("\(userVM.prenom)")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        HStack {
                            Text("Taille")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Text("\(userVM.taille ?? 0) cm")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        HStack {
                            Text("Poids")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            
                            Text("\(String(format: "%.1f", userVM.poids ?? 0)) kg")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        
                        HStack {
                            Text("Sexe")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Text("\(userVM.sexe?.description ?? "")")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        HStack {
                            Text("Date de Naissance")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Text("\(userVM.dateFormatter(userVM.dateNaissance))")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))

                        
                        HStack {
                            Text("Age")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Spacer()
                            Text("\(userVM.age ?? 0) ans")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        VStack (alignment: .leading){
                            Text("Préférences alimentaires")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            
                            Text("\(userVM.preference.description)")
                                .font(.system(size: 14, weight: .bold))
                                .padding(.vertical,5)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .vertical], 10)
                        
                        VStack(alignment: .leading) {
                            Text("Niveau d'activité")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            
                            Text("\(userVM.activityLevel.description)")
                                .font(.system(size: 14, weight: .bold))
                                .padding(.vertical,5)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 15, trailing: 10))
                        
                        VStack(alignment: .leading){
                            Text("Objectifs de santé")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            BoutonSouligne (text: "Modifier mes objectifs", color: .black, fontSize: 16, fontWeight: .medium) {
                                navigationVM.path.append(AppRoute.objectifs)
                            }
                            .padding(.vertical,5)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .top], 10)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mon profil")
                            .font(.system(size: 24, weight: .bold))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            navigationVM.path.append(AppRoute.parametres)
                        }label:{
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    Profil()
        .environment(NavigationViewModel())
        .environment(UserViewModel())
        .environment(ObjectifViewModel(userVM: userVM))
}
