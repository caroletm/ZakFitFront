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
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    @State var showRepasModal: Bool = false
    @State var showActiviteModal: Bool = false
    @State var showNotificationBadge: Bool = true
    
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
                            showNotificationBadge.toggle()
                            navigationVM.path.append(AppRoute.notifications)
                        }label:{
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.black)
                                .overlay(
                                    showNotificationBadge ?
                                    ZStack {
                                        Circle()
                                            .frame(width: 23, height: 23)
                                            .foregroundStyle(Color.red)
                                        Text("\(notifications.count)")
                                            .foregroundStyle(.white)
                                    }.offset(x: 10, y: -10) : nil)
                        }
                        
                    }.padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                    
                    HStack {
                        Text("Aujourd'hui")
                            .font(.system(size: 20, weight: .semibold))
//                        Button {
//                            Task {
//                                await objectifVM.deleteAllObjectifs()
//                            }
//                        }label: {
//                            Text("test")
//                        }
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
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    //Carrousel objectifs
                    
                    Carrousel()
                    
                    //Boutons dashboard
                    HStack(spacing: 16) {
                        
                        BoutonAjoutRepas(showRepasModal: $showRepasModal)
                        BoutonAjoutActivite(showActiviteModal: $showActiviteModal)
                        BarreCaloriesConso()
                        BarreMinsActivite()
                        
                    }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                    //Dernière activité
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Dernier repas")
                            .font(.system(size: 20, weight: .semibold))
                        if !repasVM.repasData.isEmpty {
                            BoutonLastRepas(repas: repasVM.lastRepas!)
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 0))
                        }else {
                            Text("Vous n'avez pas encore ajouté de repas")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.greyLight200)
                                .italic()
                                .padding(EdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 0))
                            
                        }
                        
                        
                        Text("Dernière activité")
                            .font(.system(size: 20, weight: .semibold))
                        if !activiteVM.activiteData.isEmpty {
                            BoutonLastActivite(activite: activiteVM.activiteData.last!)
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 0))
                        }else{
                            Text("Vous n'avez pas encore ajouté d'activités")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.greyLight200)
                                .italic()
                                .padding(EdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 0))
                        }
                    }
                }
            }
            .onAppear() {
                Task {
                    await objectifVM.fetchAllObjectifs()
                    await repasVM.fetchAliments()
                    await repasVM.fetchConsos()
                    await repasVM.fetchRepas()
                    await activiteVM.fetchActivites()
                    
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showRepasModal){
            AjoutRepas(showRepasModal: $showRepasModal, origin: .dashboard)
        }
        .sheet(isPresented: $showActiviteModal){
            AjoutActivite(showActiviteModal: $showActiviteModal, origin: .dashboard)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    Dashboard()
        .environment(NavigationViewModel())
        .environment(UserViewModel())
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
        .environment(ObjectifViewModel(userVM: userVM))
}


