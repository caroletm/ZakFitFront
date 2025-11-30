//
//  BoutonAjoutActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BoutonAjoutActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    @Binding var showActiviteModal: Bool
    
    var body: some View {
        Button {
            showActiviteModal = true
        }label:{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 68, height: 116)
                    .foregroundStyle(Color.greyDark)
                VStack {
                    Image(systemName: "figure.run")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23, height: 32)
                        .foregroundStyle(Color.white)
                    Text("Ajouter\n une activité")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 8, weight : .bold))
                        .padding(.top, 10)
                    
                }
            }
        }
    }
}

#Preview {
    BoutonAjoutActivite(showActiviteModal: .constant(false))
        .environment(NavigationViewModel())
}
