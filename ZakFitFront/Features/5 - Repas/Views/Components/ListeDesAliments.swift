//
//  ListeDesAliments.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI

struct ListeDesAliments: View {
    
    var body: some View {
        VStack (alignment :.leading){
            Text("Liste des aliments")
                .font(.system(size: 20, weight: .bold))
            ScrollView {
                
                ForEach(0..<5) { aliment in
                    
                    VStack  {
                        HStack {
                            Text("Pomme")
                            Spacer()
                            VStack (alignment: .trailing) {
                                HStack {
                                    Text("1")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("unité")
                                        .font(.system(size: 16, weight: .regular))
                                }
                                HStack {
                                    Text("40")
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
