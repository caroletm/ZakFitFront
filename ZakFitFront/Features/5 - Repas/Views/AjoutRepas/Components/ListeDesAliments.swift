//
//  ListeDesAliments.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI

struct ListeDesAliments: View {
    @Environment(RepasViewModel.self) var repasVM
    
  
    
    var body: some View {
        VStack (alignment :.leading){
            Text("Liste des aliments")
                .font(.system(size: 16, weight: .bold))
            ScrollView {
                
                ForEach(repasVM.consosTemp, id: \.id) { conso in
                    
                    VStack  {
                        HStack {
                            Text(conso.aliment.description)
                            Spacer()
                            VStack (alignment: .trailing) {
                                HStack {
                                    Text("\(conso.quantite)")
                                        .font(.system(size: 16, weight: .bold))
                                    Text(conso.portion.description)
                                        .font(.system(size: 16, weight: .regular))
                                }
                                HStack {
                                    Text("\(String(format: "%.0f", conso.calories))")
                                        .font(.system(size: 10, weight: .bold))
                                    Text("calories")
                                        .font(.system(size: 10, weight: .regular))
                                }
                            }
                        }.padding(8)
                        
                        Divider()
                            .background(Color.accent)
                            .padding(.horizontal, 20)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ListeDesAliments()
        .environment(RepasViewModel())
}
