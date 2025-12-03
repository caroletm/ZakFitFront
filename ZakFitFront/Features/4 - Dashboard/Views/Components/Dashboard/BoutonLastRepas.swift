//
//  BoutonLastRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BoutonLastRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    var repas : RepasDTO
    
    var body: some View {
        Button {
            navigationVM.path.append(AppRoute.detailRepas(repas: repas))
        }label:{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(
                            colors: [.orangeLight200, .orangeLight300],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                VStack(alignment: .leading) {
                   
                    Text("\(repasVM.dateFormatterAgo(repas.date))")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                
                    HStack {
                        Image(systemName: "fork.knife.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 37, height: 40)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        VStack(spacing: 2) {
                            Text("\(String(format : "%.0f", repas.calories))")
                                .font(.system(size: 32, weight: .bold))

                            Text("calories")
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                          
                        }
                        .foregroundStyle(.white)
                    }
                    
                    Text("\(repas.typeRepas.label)")
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
    BoutonLastRepas(repas: repas1)
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
