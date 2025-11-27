//
//  BoutonLastRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BoutonLastRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var body: some View {
        Button {
            navigationVM.path.append(AppRoute.detailRepas)
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
                   
                    Text("Il y a 50 minutes")
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
                            Text("800")
                                .font(.system(size: 32, weight: .bold))

                            Text("calories")
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                          
                        }
                        .foregroundStyle(.white)
                    }
                    
                    Text("Déjeuner")
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
    BoutonLastRepas()
        .environment(NavigationViewModel())
}
