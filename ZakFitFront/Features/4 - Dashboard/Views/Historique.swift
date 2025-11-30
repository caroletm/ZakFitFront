//
//  Historique.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Historique : View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    @State  var selectedTab: Int = 0
    @State var tabs = ["Par mois", "Par semaine"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                RepasPicker(selectedTab: $selectedTab, tabs: $tabs)
                    .padding()
                if selectedTab == 0 {
                    HistoJourSelectionne()
                }else{
                    HistoSemaineSelectionne()
                }
            }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mon historique")
                            .font(.system(size: 24, weight: .bold))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    Historique()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
        .environment(ObjectifViewModel(userVM: userVM))
}



