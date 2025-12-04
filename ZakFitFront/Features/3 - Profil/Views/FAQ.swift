//
//  FAQ.swift
//  ZakFitFront
//
//  Created by caroletm on 04/12/2025.
//

import SwiftUI

struct FAQ: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    FAQItem(
                        question: "Comment sont calculées les calories ?",
                        answer:
"""
Nous utilisons la formule de Harris et Benedict, une référence pour estimer la dépense énergétique.

Femmes :
655 + (9,6 × poids en kg) + (1,8 × taille en cm) – (4,7 × âge)

Hommes :
66 + (13,7 × poids en kg) + (5 × taille en cm) – (6,5 × âge)

Le résultat est ensuite multiplié par votre niveau d’activité pour estimer vos besoins journaliers.
"""
                    )
                    
                    FAQItem(
                        question: "Comment sont calculés les apports energétiques ?",
                        answer:
"""
• 1 g de lipides = 9 kcal  
• 1 g de glucides = 4 kcal  
• 1 g de protéines = 4 kcal  

Les recommandations de l’ANSES :  
• Protéines : 1,2 à 1,6 g par kg de poids  
• Lipides : 35 à 40% de l’apport calorique  
• Glucides : 40 à 55% de l’apport calorique  
"""
                    )
                    
                    FAQItem(
                        question: "Quelle quantité d’activité physique est recommandée ?",
                        answer:
"""
Selon le Programme National Nutrition Santé (PNNS) :  
• Adultes : au moins 30 minutes d’activité modérée 5 jours par semaine  
• Enfants / adolescents : 60 minutes par jour  

L’application calcule automatiquement vos minutes d’activité et vos calories brûlées.
"""
                    )

                    FAQItem(
                        question: "Pourquoi mes besoins caloriques peuvent-ils changer ?",
                        answer:
"""
Vos besoins évoluent selon :  
• Votre poids et votre taille  
• Votre âge  
• Votre niveau d’activité  
• Votre objectif (perte, maintien ou prise de poids)

L’application ajuste automatiquement les calculs en fonction de vos informations.
"""
                    )
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("FAQ")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FAQItem: View {
    var question: String
    var answer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.orangeLight300)
            
            Text(answer)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        
    }
}

#Preview {
    FAQ()
}
