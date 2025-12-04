//
//  TabBarView.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TabBarView: View {
    
    @Environment(UserViewModel.self) var userVM
    @Environment(NavigationViewModel.self) var navigationVM
    
    var body: some View {
        
        TabView {
            Tab("Tableau de bord", systemImage: "heart.text.clipboard") {
                Dashboard()
            }
            Tab("Repas", systemImage: "fork.knife") {
                RepasList()
            }
            Tab("Activites", systemImage: "figure.run") {
                ActivitesList()
            }
            Tab("Suivi", systemImage: "chart.line.uptrend.xyaxis") {
                Suivi()
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    TabBarView()
        .environment(UserViewModel())
        .environment(NavigationViewModel())
}
