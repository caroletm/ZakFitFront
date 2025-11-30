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
        
        VStack {
            
            PickerSemaineSelectionne()
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 215)
                .foregroundStyle(Color.white)
                .shadow(radius: 5)
                .padding(.vertical)
            
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
                
                
                VStack (spacing: 10) {
                    HStack{
                        Text("Lundi 17 Novembre :")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }  .padding(.horizontal)
                    
                    Button {
                        
                    }label:{
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.greyLight50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                        .foregroundStyle(Color.greyDark)
                                )
                            HStack {
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        Image(systemName: "fork.knife.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 37, height: 40)
                                            .foregroundStyle(.greyDark)
                                        VStack (alignment : .leading) {
                                            Text("3 repas")
                                                .font(.system(size: 16, weight: .bold))
                                            Text("2100 calories")
                                                .font(.system(size: 12, weight: .bold))
                                        }.foregroundStyle(Color.black)
                                        
                                    }
                                    
                                    HStack {
                                        Image(systemName: "figure.run")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 37, height: 40)
                                            .foregroundStyle(.greyDark)
                                        VStack (alignment : .leading) {
                                            Text("40 mins d'activité")
                                                .font(.system(size: 16, weight: .bold))
                                            Text("2100 calories brûlées")
                                                .font(.system(size: 12, weight: .bold))
                                        }.foregroundStyle(Color.black)
                                    }
                                }
                                Spacer()
                                HStack {
                                    Image(systemName: "arrow.up.circle.fill")
                                        .font(.system(size: 24, weight: .bold))
                                    VStack() {
                                        Text("1850")
                                            .font(.system(size: 16, weight: .bold))
                                        Text("calories")
                                            .font(.system(size: 16, weight: .bold))
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .frame(width: 336, height: 115)
                        }
                        .frame(width: 336, height: 120)
                    }
                    .padding(5)
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

