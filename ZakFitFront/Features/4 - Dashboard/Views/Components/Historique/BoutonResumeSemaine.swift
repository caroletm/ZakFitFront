//
//  BoutonResumeSemaine.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//

import SwiftUI

struct BoutonResumeSemaine: View {
    
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    var day : Date
    
    var body: some View {
        
        let caloriesRepas = repasVM.totalCalories(for: day)
        let nbRepas = repasVM.nbRepas(for: day)
        let minsActivite = activiteVM.totalMinutes(for: day)
        let caloriesBrulees = activiteVM.totalCalories(for: day)
        
        let difference = caloriesRepas - caloriesBrulees
        let isPositive = difference >= 0
        
        Button {
            
        }label:{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.greyLight50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundStyle(Color.greyDark)
                    )
                HStack {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Image(systemName: "fork.knife.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 37, height: 40)
                                .foregroundStyle(.greyDark)
                            VStack (alignment : .leading) {
                                Text("\(nbRepas) repas")
                                    .font(.system(size: 16, weight: .bold))
                                Text("\(String(format :"%.0f", caloriesRepas)) calories")
                                    .font(.system(size: 12, weight: .bold))
                            }.foregroundStyle(Color.black)
                            
                        }
                        
                        HStack {
                            Image(systemName: "figure.run")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 37, height: 40)
                                .foregroundStyle(.greyDark)
                            VStack (alignment : .leading) {
                                Text("\(minsActivite) mins d'activité")
                                    .font(.system(size: 16, weight: .bold))
                                Text("\(String(format :"%.0f", caloriesBrulees)) calories brûlées")
                                    .font(.system(size: 12, weight: .bold))
                            }.foregroundStyle(Color.black)
                        }
                    }
                    Spacer()
                    
                    HStack {
                        Image(systemName: isPositive ? "arrow.down.circle.fill" :"arrow.up.circle.fill")
                            .font(.system(size: 24, weight: .bold))
                        VStack() {
                            Text("\(String(format: "%.0f", difference))")
                                .font(.system(size: 16, weight: .bold))
                            Text("calories")
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
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
    let userVM = UserViewModel()
    BoutonResumeSemaine(day: Date())
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
}
