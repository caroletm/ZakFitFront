//
//  ScanModal.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI

struct ScanModal: View {
    var body: some View {
        
        ZStack {
            Color.greyLight100
                .ignoresSafeArea(edges: .all)
            
            VStack {
            Text("Scanne ton aliment : ")
                .font(.system(size: 20, weight: .bold))
                .padding()
                
                Rectangle()
                    .frame(width: 300, height: 200)
            
       
                BoutonOrange(text: "Valider", width: 105, height: 40) {
                    //
                }.padding(5)
                BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {
                    
                }
            }
        }
    }
}

#Preview {
    ScanModal()
}
