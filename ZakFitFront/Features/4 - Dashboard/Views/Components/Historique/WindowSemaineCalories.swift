//
//  WindowSemaineCalories.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//

import SwiftUI
import Charts

struct WindowSemaineCalories: View {
    
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    struct DayData: Identifiable {
        let id = UUID()
        let date: Date
        let caloriesConsommees: Double
        let caloriesBrulees: Double
    }
    
    func dataForWeek() -> [DayData] {
        let calendar = Calendar.current
        
        return (0..<7).map { offset in
            let day = calendar.date(byAdding: .day, value: Int(offset), to: activiteVM.startOfWeek)!
            
            let caloriesRepas = repasVM.repasData
                .filter { calendar.isDate($0.date, inSameDayAs: day) }
                .reduce(0) { $0 + $1.calories }
            
            let caloriesActivite = activiteVM.activiteData
                .filter { calendar.isDate($0.date, inSameDayAs: day) }
                .reduce(0) { $0 + $1.caloriesBrulees }
            
            return DayData(
                date: day,
                caloriesConsommees: caloriesRepas,
                caloriesBrulees: caloriesActivite
            )
        }
    }
    
    // Préparer les labels de l'axe X
    var joursSemaine: [String] {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "E" // lun., mar., ...
        
        return (0..<7).compactMap { offset in
            if let date = calendar.date(byAdding: .day, value: offset, to: activiteVM.startOfWeek) {
                return String(formatter.string(from: date).prefix(2)) // L M M J V S D
            }
            return nil
        }
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 215)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack (alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Calories")
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        Rectangle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.orangeLight300)
                        Text("Consommées")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.greyDark)
                        Rectangle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.greyLight100)
                        Text("Brûlées")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.greyDark)
                    }
                    
                }.padding(.leading, 10)
                
                
                Chart(Array(zip(dataForWeek(), joursSemaine)), id: \.0.id) { day, label in
                    BarMark(
                        x: .value("Jour", label),
                        y: .value("Consommées", day.caloriesConsommees)
                    )
                    .foregroundStyle(.orangeLight300)
                    
                    BarMark(
                        x: .value("Jour", label),
                        y: .value("Brûlées", day.caloriesBrulees)
                    )
                    .foregroundStyle(.greyLight100)
                }
                .chartLegend(position: .bottom)
                .chartYAxis {
                }.frame(width: 300, height: 130)
            }
        }
    }
}


#Preview {
    let userVM = UserViewModel()
    ZStack {
        Color.black.opacity(0.2).ignoresSafeArea(edges: .all)
        WindowSemaineCalories()
            .environment(RepasViewModel())
            .environment(ActiviteViewModel(userVM : userVM))
            .environment(ObjectifViewModel(userVM : userVM))
    }
}
