//
//  Dashboard.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Dashboard : View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    
    @State var showRepasModal: Bool = false
    @State var showActiviteModal: Bool = false
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack  {
                    HStack {
                        Button {
                            navigationVM.path.append(AppRoute.profil)
                            
                        }label: {
                            Image(.profilOrange)
                        }
                        Text("Bonjour \(userVM.prenom) !")
                            .font(.system(size: 24, weight: .semibold))
                        Spacer()
                        Button {
                            navigationVM.path.append(AppRoute.notifications)
                        }label:{
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.black)
                        }
                    }.padding()
                    
                    HStack {
                        Text("Aujourd'hui")
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                        Button {
                            navigationVM.path.append(AppRoute.historique)
                        }label:{
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 27)
                                .foregroundStyle(Color.black)
                        }
                    }.padding()
                    
                    //Carrousel objectifs
                    
                    Carrousel()
                    
                    //Boutons dashboard
                    HStack(spacing: 16) {
                        
                        BoutonAjoutRepas(showRepasModal: $showRepasModal)
                        BoutonAjoutActivite(showActiviteModal: $showActiviteModal)
                        BarreCaloriesConso()
                        BarreMinsActivite()
                        
                    }.padding()
                    //Dernière activité
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Dernière activité")
                            .font(.system(size: 20, weight: .semibold))
                        
                        BoutonLastActivite()
                            .padding(.vertical)
                        
                        Text("Dernier repas")
                            .font(.system(size: 20, weight: .semibold))
                        
                        BoutonLastRepas()
                            .padding(.vertical)
                    }
                }
            }
        }
        .sheet(isPresented: $showRepasModal){
            AjoutRepas()
        }
        .sheet(isPresented: $showActiviteModal){
            AjoutActivite()
        }
    }
}

#Preview {
    Dashboard()
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}


