//
//  CaloriesDuJour.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI
import Charts

struct MacrosDuJour: View {
    
    struct CalorieData: Identifiable {
        let id = UUID()
        let label: String
        let value: Double
    }
    
    let proteines: Double
    let glucides: Double
    let lipides: Double
    
    let colors: [String : Color] = [
        "Proteines": .orangeLight300,
        "Glucides": .greyLight100,
        "Lipides": .orangeLight100
    ]
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 215)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack {
                
                VStack (alignment: .leading, spacing: 5) {
                    Text("Apports nutritionnels")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Restants = Objectif - Macronotriments consommés")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color.greyDark)
                }.offset(x: 0, y: -10)
                
                HStack {
                    
                    ZStack {
                        
//                        let remaining = max(goal - consumed, 0)
                        let data = [
                            CalorieData(label: "Proteines", value: proteines),
                            CalorieData(label: "Glucides", value: glucides),
                            CalorieData(label: "Lipides", value: lipides)
                        ]
                        
                        Chart(data) { element in
                            SectorMark(
                                angle: .value("Calories", element.value),
                                innerRadius: .ratio(0.85),
                                angularInset: 2
                            )
                            .foregroundStyle(by: .value("Type", element.label))
                            .cornerRadius(10)
                        }
                        .chartForegroundStyleScale([
                            "Proteines": colors["Proteines"]!,
                            "Glucides": colors["Glucides"]!,
                            "Lipides": colors["Lipides"]!
                        ])
                        .chartLegend(.hidden)
                        .frame(height: 120)
                  
                        
                        VStack {
                            Text("Restants:")
                                .font(.system(size: 12, weight: .semibold))
                            VStack{
                                Text("10g de protéines")
                                Text("10g de glucides")
                                Text("10g de lipides")
                            }
                            .font(.system(size: 10, weight: .regular))
                        }
                    }
                    .offset(x: -30)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Macronutriments\n consommés")
                            .font(.system(size: 12, weight: .semibold))
                        
                        HStack {
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color.orangeLight300)
                            Text("Protéines: 200 g")
                                .font(.system(size: 10, weight: .regular))
                        }
                        HStack {
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color.greyLight200)
                            Text("Glucides: 200 g")
                                .font(.system(size: 10, weight: .regular))
                        }
                        HStack {
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color.orangeLight100)
                            Text("Lipides: 200 g")
                                .font(.system(size: 10, weight: .regular))
                        }
                        
                    }
                    .offset(x: -60, y: 0)
                }
            }
        }
    }
}

#Preview {
    MacrosDuJour(proteines: 200, glucides: 200, lipides: 600)
}
