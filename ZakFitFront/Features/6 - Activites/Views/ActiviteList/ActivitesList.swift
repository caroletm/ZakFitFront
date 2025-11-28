//
//  ActivitesList.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct ActivitesList : View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    var body: some View {
        
        NavigationView {
            VStack {
                Button {
                    navigationVM.path.append(AppRoute.ajoutActivite)
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 336, height: 114)
                            .foregroundStyle(Color.greyLight100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                            )
                        VStack {
                            Image(systemName: "figure.run")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 39, height: 54)
                            Text("Ajouter une activité")
                                .font(.system(size: 16, weight: .bold))
                        }

                    }
                    .foregroundStyle(Color.greyDark)
                  
                }.padding()
                HStack {
                    Text("Liste des activités :")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    Button {
                        //
                    }label:{
                        ZStack {
                            Circle()
                                .frame(width: 31, height: 31)
                                .foregroundStyle(Color.orangeLight300)
                            Image(systemName: "line.3.horizontal.decrease")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17, height: 11)
                                .foregroundStyle(Color.white)
                        }
                    }
                    Button {
                        //
                    }label:{
                        ZStack {
                            Circle()
                                .frame(width: 31, height: 31)
                                .foregroundStyle(Color.orangeLight300)
                            Image(systemName: "arrow.up.arrow.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17, height: 11)
                                .foregroundStyle(Color.white)
                        }
                    }
                }
                .padding()
                
                ScrollView {
                    ForEach(activiteVM.activiteData, id: \.self) { activite in
                        BoutonActivite(activite : activite)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Mes activités")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ActivitesList()
        .environment(NavigationViewModel())
        .environment(ActiviteViewModel(userVM : userVM))
}
