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
    
    var body: some View {
        
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
                        //
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
                        //
                    }label:{
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 27)
                            .foregroundStyle(Color.black)
                    }
                }.padding()
                
                //Carrousel objectifs
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 345, height: 215)
                        .shadow(radius: 5)
                    HStack(spacing: 8) {
                        ForEach (0..<4) { _ in
                            Circle()
                                .fill(Color.greyLight100)
                                .frame(width: 8, height: 8)
                        }
                    }.padding()
                }
                //Boutons dashboard
                HStack(spacing: 16) {
                    Button {
                        //
                    }label:{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 116)
                            .foregroundStyle(Color.orangeLight300)
                    }
                    Button {
                        //
                    }label:{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 116)
                            .foregroundStyle(Color.greyDark)
                    }
                    Button {
                        //
                    }label:{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 116)
                            .foregroundStyle(Color.orangeLight300)
                            .opacity(0.2)
                    }
                    Button {
                        //
                    }label:{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 68, height: 116)
                            .foregroundStyle(Color.greyDark)
                            .opacity(0.3)
                    }
                }.padding()
                //Dernière activité
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Dernière activité")
                    .font(.system(size: 20, weight: .semibold))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 336, height: 115)
                    
                    Text("Dernier repas")
                    .font(.system(size: 20, weight: .semibold))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 336, height: 115)
                }
            }
        }
    }
}

#Preview {
    Dashboard()
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}
