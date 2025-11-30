//
//  CaloriesDuJour.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI
import Charts

struct CaloriesDuJour: View {
    
    struct CalorieData: Identifiable {
        let id = UUID()
        let label: String
        let value: Double
    }
    
    let consumed: Double
    let goal: Double
    
    let colors: [String : Color] = [
        "Consommées": .orangeLight300,
        "Restantes": .greyLight100
    ]
    
    var body: some View {
        
        let remaining = max(goal - consumed, 0)
        let data = [
            CalorieData(label: "Consommées", value: consumed),
            CalorieData(label: "Restantes", value: remaining)
        ]
        
        Chart(data) { element in
            SectorMark(
                angle: .value("Calories", element.value),
                innerRadius: .ratio(0.6),
                angularInset: 2
            )
            .foregroundStyle(by: .value("Type", element.label))
            .cornerRadius(6)
        }
        .chartForegroundStyleScale([
            "Consommées": colors["Consommées"]!,
            "Restantes": colors["Restantes"]!
        ])
        .chartLegend(position: .trailing)
        .chartLegend(alignment: .center)
        .frame(height: 130)
    }
}

#Preview {
    CaloriesDuJour(consumed: 1200, goal: 1900)
}
