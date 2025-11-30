//
//  AllDayRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI

struct AllDayRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Tous mes repas :")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
                if repasVM.isFilterActive {
                    Button {
                        repasVM.resetFilter()
                    }label: {
                        Text("Vider les filtres")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                Button {
                    navigationVM.path.append(AppRoute.repasFiltres)
                }label : {
                    ZStack {
                        Circle()
                            .foregroundStyle(.greyDark)
                            .frame(width: 31, height: 31)
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(.orangeLight100)
                    }
                }
            }.padding()
            
            ScrollView {
                if repasVM.repasFiltres.isEmpty && !repasVM.isFilterActive {
                        Text("Pas de repas pour l'instant")
                }
                    else if repasVM.repasFiltres.isEmpty && repasVM.isFilterActive {
                        Text("Aucun repas ne correspond à vos critères")
                }else {
                    ForEach(repasVM.repasFiltres, id: \.self) { repas in
                        BoutonRepas(repas: repas)
                    }
                }
            }
        }
    }
}

#Preview {
    AllDayRepas()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}


