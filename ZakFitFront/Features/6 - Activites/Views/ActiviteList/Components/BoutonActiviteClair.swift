//
//  BoutonActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI

struct BoutonActiviteClair: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    var activite : ActiviteDTO
    
    var body: some View {
        Button {
//            navigationVM.path.append(AppRoute.detailActivite(activite: activite))
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.greyLight100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundStyle(Color.greyDark)
                    )
                
                VStack(alignment: .leading) {
                   
                    Text("Le \(activiteVM.dateFormatter(activite.date))")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.orangeLight300)
                
                    HStack {
                        Image(systemName: "\(activite.typeActivite.imageName)")
                            .font(.system(size: 32))
                            .foregroundStyle(.greyDark)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(activite.duree)")
                                    .font(.system(size: 32, weight: .bold))
                                Text("minutes")
                                    .font(.system(size: 14, weight: .bold))
                            }
                            .foregroundStyle(.orangeLight300)
                            
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(String(format: "%.0f", activite.caloriesBrulees))")
                                    .font(.system(size: 16, weight: .bold))
                                Text("calories brûlées")
                                    .font(.system(size: 8, weight: .bold))
                            }
                            .foregroundStyle(.greyDark)
                        }
                    }
                    
                    Text("\(activite.typeActivite.description)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.greyDark)
                }
                .padding()
                .frame(width: 336, height: 115)
            }
            .frame(width: 336, height: 120)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    BoutonActiviteClair(activite: activite1)
        .environment(NavigationViewModel())
        .environment(ActiviteViewModel(userVM : userVM))
}
