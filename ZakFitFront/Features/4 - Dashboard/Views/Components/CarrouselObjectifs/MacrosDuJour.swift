//
//  CaloriesDuJour.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI
import Charts

struct MacrosDuJour: View {
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM

    
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
    
    
    var restantsProteines : Double {
        return max(objectifVM.lastObjectif?.proteines ?? objectifVM.proteinesCiblesCalculees() - proteines, 0)
    }
    var restantsGlucides : Double {
        return max(objectifVM.lastObjectif?.glucides ?? objectifVM.glucidesCiblesCalculees() - glucides, 0)
    }
    var restantsLipides : Double {
        return max(objectifVM.lastObjectif?.lipides ?? objectifVM.lipidesCiblesCalculees() - lipides, 0)
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
                    Text("Apports nutritionnels")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Restants = Objectif - Macronutriments consommés")
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
                                Text("\(String(format: "%.0f", restantsProteines)) g de protéines")
                                Text("\(String(format: "%.0f", restantsGlucides)) g de glucides")
                                Text(" \(String(format: "%.0f", restantsLipides)) g de lipides")
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
                            Text("Protéines: \(String(format: "%.0f", repasVM.macrosJour.proteines)) g")
                                .font(.system(size: 10, weight: .regular))
                        }
                        HStack {
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color.greyLight200)
                            Text("Glucides: \(String(format: "%.0f", repasVM.macrosJour.glucides)) g")
                                .font(.system(size: 10, weight: .regular))
                        }
                        HStack {
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(Color.orangeLight100)
                            Text("Lipides: \(String(format: "%.0f", repasVM.macrosJour.lipides)) g")
                                .font(.system(size: 10, weight: .regular))
                        }
                        
                    }
                    .offset(x: -60, y: 0)
                }
            }
        }
        .onAppear() {
            Task {
                await objectifVM.fetchAllObjectifs()
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ZStack {
        Color.black.opacity(0.3).ignoresSafeArea(edges: .all)
        MacrosDuJour(proteines: 200, glucides: 200, lipides: 600)
            .environment(RepasViewModel())
            .environment(ActiviteViewModel(userVM : userVM))
            .environment(ObjectifViewModel(userVM : userVM))
    }
}
