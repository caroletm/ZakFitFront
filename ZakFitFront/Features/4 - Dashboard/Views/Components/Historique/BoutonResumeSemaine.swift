//
//  BoutonResumeSemaine.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//

import SwiftUI

struct BoutonResumeSemaine: View {
    
    var body: some View {
        
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
                                Text("3 repas")
                                    .font(.system(size: 16, weight: .bold))
                                Text("2100 calories")
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
                                Text("40 mins d'activité")
                                    .font(.system(size: 16, weight: .bold))
                                Text("2100 calories brûlées")
                                    .font(.system(size: 12, weight: .bold))
                            }.foregroundStyle(Color.black)
                        }
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 24, weight: .bold))
                        VStack() {
                            Text("1850")
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
    BoutonResumeSemaine()
}
