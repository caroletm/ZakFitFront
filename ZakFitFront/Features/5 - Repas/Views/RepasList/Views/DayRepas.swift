//
//  DayRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI

struct DayRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    var body: some View {
        
        @Bindable var repasVM = repasVM
        
        VStack {
            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 27)
                    .padding(.vertical, 5)
                
                DatePicker(
                    "",
                    selection: $repasVM.selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.compact)
                

            }.padding()
            HStack {
                Text("Repas de cette journée :")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView {
                ForEach(repasVM.repasDuJour, id: \.self) { repas in
                    BoutonRepas(repas: repas)
                }
                ZStack {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(Color.greyDark)
                    VStack {
                        Text("\(String(format: "%.0f", repasVM.totalCaloriesJour))")
                            .font(.system(size: 16, weight: .bold))
                        Text("calories")
                            .font(.system(size: 10, weight: .bold))
                    }.foregroundStyle(Color.white)
                }.padding(EdgeInsets(top: 40, leading: 10, bottom: 10, trailing: 10))
            
     
            
                
            }
        }
        .onAppear {
            Task {
                await repasVM.fetchRepas()
                await repasVM.fetchConsos()
                await repasVM.fetchAliments()
            }
        }
    }
}
#Preview {
    DayRepas()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
