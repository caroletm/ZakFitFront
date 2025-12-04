//
//  CaloriesDuJour.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI
import Charts

struct CaloriesDuJour: View {
    
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
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
    
    var caloriesRestantes : Double {
        return max(goal - consumed, 0)
    }
    
    var lastObjectif : ObjectifDTO? {
        objectifVM.objectifData.last
    }
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 215)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack {
                
                VStack (alignment: .leading, spacing: 5) {
                    Text("Calories")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Restants = Objectif - Consommées + Calories brûlées")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color.greyDark)
                }.offset(x: 0, y: -10)
                
                HStack {
                    
                    ZStack {
                        let remaining = max(goal - consumed, 0)
                        let data = [
                            CalorieData(label: "Consommées", value: consumed),
                            CalorieData(label: "Restantes", value: remaining)
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
                            "Consommées": colors["Consommées"]!,
                            "Restantes": colors["Restantes"]!
                        ])
                        .chartLegend(.hidden)
                        .frame(height: 105)
                        
                        VStack {
                            Text("\(String(format: "%0.f", caloriesRestantes))")
                                .font(.system(size: 20, weight: .semibold))
                            Text("Restants")
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }   .offset(x: -30)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image(systemName: "target")
                                .foregroundStyle(Color.greyDark)
                                .font(.system(size: 24))
                            VStack(alignment: .leading){
                                Text("Objectif quotidien")
                                    .font(.system(size: 12, weight: .medium))
                                Text("\(String(format: "%0.f", lastObjectif?.caloriesParJour ??  objectifVM.caloriesCiblesCalculees()))")
                                    .font(.system(size: 14, weight: .bold))
                            }
                        }
                        
                        HStack {
                            Image(systemName: "fork.knife")
                                .foregroundStyle(Color.orangeLight300)
                                .font(.system(size: 24))
                            VStack(alignment: .leading){
                                Text("Consommées")
                                    .font(.system(size: 12, weight: .medium))
                                Text("\(String(format: "%0.f", repasVM.totalCaloriesJour))")
                                    .font(.system(size: 14, weight: .bold))
                            }
                        }
                    }
                    .offset(x: -40)
                }
//                .offset(x: -20, y: 5)
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ZStack {
        Color.black.opacity(0.3).ignoresSafeArea(edges: .all)
        CaloriesDuJour(consumed: 1200, goal: 1700)
            .environment(RepasViewModel())
            .environment(ActiviteViewModel(userVM : userVM))
            .environment(ObjectifViewModel(userVM : userVM))
    }
}
