//
//  CaloriesDuJour.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct MessageDuJour: View {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 215)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            VStack {
                
                Text("Message du coach :")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.greyDark)
                    .offset(x: -90, y: -40)
                
                
                Text("\"Bravo ! Vous avez atteint 90 % de votre objectif de durée d'activité pour cette semaine !\"")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.greyDark)
                
            }.frame(width: 320, height: 215)
        }
    }
}

#Preview {
    MessageDuJour()
}
