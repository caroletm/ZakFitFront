//
//  BoutonActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI

struct BoutonActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    var activite : Activite
    
    var body: some View {
        Button {
//            navigationVM.path.append(AppRoute.detailActivite(activite: activite))
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(
                            colors: [.greyLight100, .greyDark],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                VStack(alignment: .leading) {
                   
                    Text("Le \(activiteVM.dateFormatter(activite.date))")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.greyDark)
                
                    HStack {
                        Image(systemName: "\(activite.typeActivite?.imageName ?? "")")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(activite.duree)")
                                    .font(.system(size: 32, weight: .bold))
                                Text("minutes")
                                    .font(.system(size: 14, weight: .bold))
                            }
                            .foregroundStyle(.greyDark)
                            
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(String(format: "%.0f", activite.caloriesBrulees))")
                                    .font(.system(size: 16, weight: .bold))
                                Text("calories brûlées")
                                    .font(.system(size: 8, weight: .bold))
                            }
                            .foregroundStyle(.white)
                        }
                    }
                    
                    Text("\(activite.typeActivite?.description ?? "")")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .padding()
                .frame(width: 336, height: 115)
            }
            .frame(width: 336, height: 140)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    BoutonActivite(activite: activite1)
        .environment(NavigationViewModel())
        .environment(ActiviteViewModel(userVM : userVM))
}
