//
//  RectangleMacronutriments.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//
import SwiftUI

struct RectangleMacronutriments: View {
    @Environment(RepasViewModel.self) var repasVM
    
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
                Text("Protéines :  \(String(format: "%.1f",repasVM.calculerProteinesTotalesRepas()))g")
                    .font(.system(size: 12, weight: .regular))
                Text("Glucides : \(String(format: "%.1f",repasVM.calculerGlucidesTotalesRepas())) g")
                    .font(.system(size: 12, weight: .regular))
                Text("Lipides : \(String(format: "%.1f",repasVM.calculerLipidesTotalesRepas())) g")
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}

#Preview {
    RectangleMacronutriments()
        .environment(RepasViewModel())
}
