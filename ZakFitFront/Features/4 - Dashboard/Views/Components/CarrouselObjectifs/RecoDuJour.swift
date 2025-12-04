//
//  CaloriesDuJour.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct RecoDuJour: View {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 215)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            VStack {
                Text("Conseil du jour")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.greyDark)
                    .offset(x: -90, y: -50)
                
                Text("\"Ajoutez 20g de proteines pour atteindre votre objectif\"")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.orangeLight300)
            } .frame(width: 320, height: 215)
        }
    }
}

#Preview {
    RecoDuJour()
}
