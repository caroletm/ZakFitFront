//
//  PremiumPage.swift
//  ZakFitFront
//
//  Created by caroletm on 04/12/2025.
//

import SwiftUI

struct PremiumPage: View {
    
    @Binding var showPremiumPage : Bool
    
    enum fonctionalitePremium : String, CaseIterable{
        case scan
        case suivi
        case coach
        case programme
        
        var image: String {
            switch self {
            case .scan:
                return "barcode.viewfinder"
            case .suivi:
                return "chart.line.uptrend.xyaxis"
            case .coach:
                return "figure.dance"
            case .programme:
                return "bell"
            }
        }
        var description: String {
            switch self {
            case .scan:
                return "Scanner mes aliments "
            case .suivi:
                return "Suivre mon poids quotidiennement"
            case .coach:
                return "Parler à Zak (coach)"
            case .programme:
                return "Personnaliser mon programme"
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Image(.backgroundPagePayante)
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
         
                Image(.logoZakFitPlus)
               
                Spacer().frame(height: 40)
                VStack {
                    Text("Passez à ZakFit+ pour : ")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    Text("4,99 € par mois")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.orangeLight300)
                    Spacer().frame(height: 10)
                    VStack {
                        Text("Annulable à tout moment")
                        Text("Aucun engagement")
                        Text("Essai gratuit 7 jours")
                    }
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.secondary)
                    
                    Spacer().frame(height: 40)
                    
                    VStack (alignment: .leading) {
                        
                        ForEach(fonctionalitePremium.allCases,  id: \.self)  { fonctionnalite in
                            HStack {
                                Image(systemName: fonctionnalite.image)
                                    .font(.system(size: 40, weight: .regular))
                                    .foregroundColor(.greyDark)
                                Text(fonctionnalite.description)
                                    .font(.system(size: 16, weight: .semibold))
                                
                            }.padding(3)
                        }
                    }
                }
                BoutonOrange(text: "Commencer l'essai gratuit", width: 260, height: 50) {
                    //
                }.padding()
                
                BoutonSouligne(text: "Plus tard", color: .black, fontSize: 14, fontWeight: .regular) {
                    showPremiumPage.toggle()
                }
            }
        }
    }
}

#Preview {
    PremiumPage(showPremiumPage: .constant(false))
}
