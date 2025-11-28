//
//  BoutonRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//
import SwiftUI

struct BoutonRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    var repas : Repas
    
    var body: some View {
        
        Button {
            navigationVM.path.append(AppRoute.detailRepas(repas: repas))
        }label:{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orangeLight50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                    )
                
                VStack(alignment: .leading) {
                    
                    Text("Le \(repasVM.dateFormatter(repas.date))")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.black)
                    
                    HStack {
                        Image(systemName: "fork.knife.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 37, height: 40)
                            .foregroundStyle(.orangeLight300)
                        
                        Spacer()
                        
                        VStack(spacing: 2) {
                         
                            Text("\(String(format: "%.0f",repas.calories))")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            
                            Text("calories")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                    }
                    
                    Text("\(repas.typeRepas.label)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.black)
                }
                .padding(.horizontal)
                .frame(width: 336, height: 115)
            }
            .frame(width: 336, height: 120)
        }
        .padding(5)
    }
}

#Preview {
    BoutonRepas(repas: repas1)
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
