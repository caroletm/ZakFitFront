//
//  HistoSemaineSelectionne.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//

import SwiftUI

struct HistoSemaineSelectionne: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    
    var body: some View {
        
        @Bindable var repasVM = repasVM
        @Bindable var activiteVM = activiteVM
        
   
        
        VStack {
            
            PickerSemaineSelectionne()
                .onChange(of: activiteVM.selectedDate) { _, newDate in
                      repasVM.selectedDate = newDate
                  }
            
            WindowSemaineCalories()
                .padding()
            
            
            ScrollView {
                HStack{
                    Text("Résumé de la semaine :")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }  .padding(.horizontal)
                
                HStack (spacing: 10) {
                    
                    ResumeRectangle(calories: String(format : "%.0f", activiteVM.totalCaloriesBruleesSemaineSelectionne), colorBackground: LinearGradient(colors: [.greyLight100, .greyLight200],startPoint: .top, endPoint: .bottom), texte: "calories\n brûlées")
                    ResumeRectangle(calories: String(format : "%.0f", repasVM.totalCaloriesRepasSemaineSelectionne), colorBackground: LinearGradient(colors: [.orangeLight200, .orangeLight300],startPoint: .top, endPoint: .bottom), texte: "calories\nconsommées")
                    ResumeRectangle(calories: String(activiteVM.totalMinsActivitesSemaineSelectionne), colorBackground: LinearGradient(colors: [.greyLight100, .greyLight200],startPoint: .top, endPoint: .bottom), texte: "minutes\n d'activité")
                    ResumeRectangle(calories: String(repasVM.nbRepasSemaine), colorBackground: LinearGradient(colors: [.orangeLight200, .orangeLight300],startPoint: .top, endPoint: .bottom), texte: "repas\nenregistrés")
                }
                .padding(.vertical)
                
                let daysOfWeek = Calendar.current.daysOfWeek(containing: activiteVM.selectedDate)
                
                let fullDays = daysOfWeek.filter { day in
                    repasVM.hasRepas(on: day) || activiteVM.hasActivite(on: day)
                }

                ForEach(fullDays, id: \.self) { day in
                    
                    VStack(alignment: .center, spacing: 6) {

                        HStack{
                            Text(repasVM.dateFormatterLong(day))
                                .font(.system(size: 16, weight: .bold))
                            Spacer()
                        }
                        .padding(.horizontal)

                        BoutonResumeSemaine(day: day)
                    }
                }
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    HistoSemaineSelectionne()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
        .environment(ObjectifViewModel(userVM: userVM))
}



