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
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .accentColor(.orangeLight300)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Text("Résumé de la journée du \(repasVM.dateFormatter(selectedDate))")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
                HStack (spacing: 10) {
                    ResumeRectangle(calories: String(format : "%.0f", activiteVM.totalCaloriesBruleesJour), colorBackground: LinearGradient(colors: [.greyLight100, .greyLight200],startPoint: .top, endPoint: .bottom
                    ), texte: "calories\n brûlées")
                    ResumeRectangle(calories: String(format : "%.0f", repasVM.totalCaloriesJour), colorBackground: LinearGradient(colors: [.orangeLight200, .orangeLight300],startPoint: .top, endPoint: .bottom
                    ), texte: "calories\nconsommées")
                    ResumeRectangle(calories: String(format : "%.0f", activiteVM.totalMinsActivitesJour), colorBackground: LinearGradient(colors: [.greyLight100, .greyLight200],startPoint: .top, endPoint: .bottom
                    ), texte: "minutes\n d'activité")
                    ResumeRectangle(calories: String(format : "%.0f", repasVM.totalCaloriesJour), colorBackground: LinearGradient(colors: [.orangeLight200, .orangeLight300],startPoint: .top, endPoint: .bottom
                    ), texte: "repas\nenregistrés")
                }
                Divider()
                    .background(Color.accent)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                
      
                    ForEach(repasVM.repasDuJour, id: \.self) { repas in
                        BoutonRepas(repas: repas)
                    }
  
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Mon historique")
                        .font(.system(size: 24, weight: .bold))
                }
            }
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


