//
//  RectangleMacronutriments.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//
import SwiftUI

struct RectangleMacronutriments: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 158, height: 117)
                .foregroundStyle(Color.orangeLight50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.orangeLight300, lineWidth: 1)
                )
            
            VStack (spacing: 5) {
                Text("Macronutriments")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.black)
                Text("Protéines : 10g")
                    .font(.system(size: 12, weight: .regular))
                Text("Glucides : 10g")
                    .font(.system(size: 12, weight: .regular))
                Text("Lipides : 10g")
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}
