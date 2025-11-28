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
        VStack {
            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 27)
                    .padding(.vertical, 5)
                
                Text("Lundi 28 /11/2025")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }.padding()
            HStack {
                Text("Repas de cette journée :")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView {
                ForEach(repasVM.repasData, id: \.self) { repas in
                    BoutonRepas(repas: repas)
                }
            }
            
            ZStack {
                Circle()
                    .frame(width: 90, height: 90)
                    .foregroundStyle(Color.greyDark)
                VStack {
                    Text("800")
                        .font(.system(size: 16, weight: .bold))
                    Text("calories")
                        .font(.system(size: 10, weight: .bold))
                }.foregroundStyle(Color.white)
            
                
            }
        }
    }
}
#Preview {
    DayRepas()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
