//
//  BoutonAjoutRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BoutonAjoutRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    @Binding var showRepasModal : Bool
    
    var body: some View {
        Button {
            showRepasModal = true
        }label:{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 68, height: 116)
                    .foregroundStyle(Color.orangeLight300)
                VStack {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 26)
                        .foregroundStyle(Color.white)
                    Text("Ajouter\n un repas")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 8, weight : .bold))
                        .padding(.top, 10)
                        
                }
            }
        }
    }
}

#Preview {
    BoutonAjoutRepas(showRepasModal: .constant(false))
        .environment(NavigationViewModel())
}
