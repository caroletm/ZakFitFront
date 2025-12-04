//
//  HistoJourSelectionne.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//
import SwiftUI

struct HistoJourSelectionne: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    var body: some View {
        
        @Bindable var repasVM = repasVM
        @Bindable var activiteVM = activiteVM
        
        VStack {
            ScrollView {
                DatePicker(
                    "",
                    selection: $repasVM.selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .accentColor(.orangeLight300)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .onChange(of: repasVM.selectedDate) {
                    activiteVM.selectedDate = repasVM.selectedDate
                }
                Text("Résumé de la journée du \(repasVM.dateFormatter(repasVM.selectedDate))")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
                
                HStack (spacing: 10) {
                    ResumeRectangle(calories: String(format : "%.0f", activiteVM.totalCaloriesBruleesJourSelectionne), colorBackground: LinearGradient(colors: [.greyLight100, .greyLight200],startPoint: .top, endPoint: .bottom), texte: "calories\n brûlées")
                    ResumeRectangle(calories: String(format : "%.0f", repasVM.totalCaloriesRepasJourSelectionne), colorBackground: LinearGradient(colors: [.orangeLight200, .orangeLight300],startPoint: .top, endPoint: .bottom), texte: "calories\nconsommées")
                    ResumeRectangle(calories: String(activiteVM.totalMinsActivitesJourSelectionne), colorBackground: LinearGradient(colors: [.greyLight100, .greyLight200],startPoint: .top, endPoint: .bottom), texte: "minutes\n d'activité")
                    ResumeRectangle(calories: String(repasVM.nbRepasJourSelectionne), colorBackground: LinearGradient(colors: [.orangeLight200, .orangeLight300],startPoint: .top, endPoint: .bottom), texte: "repas\nenregistrés")
                }
                
                Divider()
                    .background(Color.accent)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                
                
                
                VStack (spacing: 10) {
                    ForEach(repasVM.repasJourSelectionne, id: \.self) { repas in
                        BoutonRepas(repas: repas)
                    }
                    ForEach(activiteVM.activitesDuJourSelectionne, id: \.self) { activite in
                        BoutonActiviteClair(activite : activite)
                    }
                }
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    HistoJourSelectionne()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
        .environment(ObjectifViewModel(userVM: userVM))
}
