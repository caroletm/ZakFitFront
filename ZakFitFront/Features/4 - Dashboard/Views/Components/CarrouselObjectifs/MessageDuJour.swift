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
            
            Text("\"Bravo ! Vous avez atteint 90 % de votre objectif calorique pour cette semaine !\"")
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color.greyDark)
                .frame(width: 320, height: 215)
        }
    }
}

#Preview {
    MessageDuJour()
}
