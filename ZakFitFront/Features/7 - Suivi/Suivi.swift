//
//  Stats.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI
import Charts

struct WeightEntry: Identifiable {
    let id = UUID()
    let date: Date
    let weight: Double
}

struct Suivi: View {
    
    @State var showPremiumPage : Bool = false
    
    // Exemple de données
    let weightHistory: [WeightEntry] = [
        WeightEntry(date: Date().addingTimeInterval(-5*86400), weight: 76),
        WeightEntry(date: Date().addingTimeInterval(-4*86400), weight: 75.4),
        WeightEntry(date: Date().addingTimeInterval(-3*86400), weight: 75),
        WeightEntry(date: Date().addingTimeInterval(-2*86400), weight: 74.8),
        WeightEntry(date: Date().addingTimeInterval(-1*86400), weight: 74.6)
    ]
    let currentWeight = 59.5
    let targetWeight  = 57.0
    
    var progress: Double {
        let startingWeight = 62.0
        return (startingWeight - currentWeight) / (startingWeight - targetWeight)
    }
    
    var body: some View {
        
        NavigationView {
                
                ZStack {
                    
                    VStack(alignment: .leading, spacing: 28) {
                        
                        HStack {
                            Spacer()
                            Text("Mon suivi")
                                .font(.system(size: 24, weight: .bold))
                            Spacer()
                        }
                        
                        // MARK: - Objectif santé
                        
                        HStack {
                            Image(systemName: "figure.mixed.cardio")
                                .font(.system(size: 45))
                                .foregroundStyle(.greyDark)
                            Spacer()
                                .frame(width: 20)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Objectif de santé")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                
                                Text("Perte de poids")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.orangeLight300)
                            }
                        }
                        .padding()
                        
                        // MARK: - Cards Poids
                        
                        
                        HStack(spacing: 14) {
                            infoCard(title: "Poids actuel",
                                     value: "\(Int(currentWeight)) kg")
                            
                            infoCard(title: "Objectif",
                                     value: "\(Int(targetWeight)) kg")
                        }
                        .padding()
                        
                        
                        // MARK: - Progression
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Progression")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.greyDark)
                            
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 10)
                                    .foregroundColor(.greyLight200)
                                
                                Capsule()
                                    .frame(width: UIScreen.main.bounds.width * 0.8 * progress,
                                           height: 10)
                                    .foregroundColor(.orangeLight300)
                            }
                            .padding(.vertical, 4)
                            
                            Text("\(Int(progress * 100)) % atteint")
                                .font(.system(size: 14))
                                .foregroundColor(.greyDark.opacity(0.6))
                        }
                        .padding(.horizontal)
                        
                        
                        // MARK: - Courbe évolution
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Évolution du poids")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.greyDark)
                            
                            Chart(weightHistory) { entry in
                                
                                // Ligne principale
                                LineMark(
                                    x: .value("Date", entry.date),
                                    y: .value("Poids", entry.weight)
                                )
                                .foregroundStyle(.orangeLight300)
                                .lineStyle(StrokeStyle(lineWidth: 3, lineCap: .round))
                                
                                // Petits points
                                PointMark(
                                    x: .value("Date", entry.date),
                                    y: .value("Poids", entry.weight)
                                )
                                .foregroundStyle(.orangeLight200)
                            }
                            .frame(height: 180)
                            .padding(.top, 4)
                        }
                        .padding(.horizontal)
                        Spacer()
                        
                    }
                    
                    .padding(.bottom, 20)
                    Rectangle()
                        .fill(Color.white.opacity(0.7))
                        .blur(radius: 10 )
                        .ignoresSafeArea()
                    
                }
            }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                showPremiumPage = true
            }
        }
        .fullScreenCover(isPresented: $showPremiumPage){
            PremiumPage(showPremiumPage: $showPremiumPage)
        }
    }
}


func infoCard(title: String, value: String) -> some View {
    VStack(alignment: .leading, spacing: 6) {
        
        Text(title)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.black)
        
        Text(value)
            .font(.system(size: 26, weight: .bold))
            .foregroundColor(.orangeLight300)
    }
    .padding(16)
    .frame(maxWidth: .infinity)
    .background(.orangeLight50)
    .cornerRadius(16)
    .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(.orangeLight300, lineWidth: 1)
    )
}

#Preview {
    Suivi()
}
