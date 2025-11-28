//
//  ActivitesList.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct RepasList : View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    @State  var selectedTab: Int = 0
    @State var tabs = ["Tous les jours", "Par journée"]
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                RepasPicker(selectedTab: $selectedTab, tabs: $tabs)
                    .padding(.top, 10)
                
                Button {
                    navigationVM.path.append(AppRoute.ajoutRepas)
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 336, height: 114)
                            .foregroundStyle(Color.orangeLight100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                            )
                        VStack {
                            Image(systemName: "fork.knife")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 41)
                            Text("Ajouter un repas")
                                .font(.system(size: 16, weight: .bold))
                        }

                    }
                  
                }.padding()
                
                if selectedTab == 0 {
                    AllDayRepas()
                } else {
                    DayRepas()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Mes repas")
                        .font(.system(size: 24, weight: .bold))
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RepasList()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
