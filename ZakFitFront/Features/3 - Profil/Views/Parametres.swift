//
//  Parametres.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Parametres : View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    @State var notificationActive : Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                VStack (alignment :.leading, spacing : 20) {
                    Text("Général")
                        .font(.system(size: 20, weight: .bold))
                    Text("Modifier mon profil")
                        .font(.system(size: 16, weight: .medium))
                }
                .padding()
                
                Divider()
                    .background(Color.accent)
                    .padding(.horizontal, 20)
                
                
                VStack (alignment :.leading, spacing : 20) {
                    Text("Aide et support")
                        .font(.system(size: 20, weight: .bold))
                    Text("FAQ")
                        .font(.system(size: 16, weight: .medium))
                    Text("Contactez-nous")
                        .font(.system(size: 16, weight: .medium))
                }
                .padding()
                
                Divider()
                    .background(Color.accent)
                    .padding(.horizontal, 20)
                
                VStack (alignment :.leading, spacing : 20) {
                    Text("Paramètres de l'application")
                        .font(.system(size: 20, weight: .bold))
                    HStack {
                        Text("Notifications")
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Toggle("", isOn: $notificationActive)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .orangeLight300))
                    }
                    
                    Text("Confidentialité")
                        .font(.system(size: 16, weight: .medium))
                    Text("Conditions Générales d'utilisation")
                        .font(.system(size: 16, weight: .medium))
                }
                .padding()
                
                Text("Se déconnecter")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundStyle(.red)
                    .underline()
                    .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement : .principal) {
                    Text("Mes paramètres")
                        .font(.system(size: 24, weight: .bold))
                }
            }
        }
    }
}

#Preview {
    Parametres()
        .environment(NavigationViewModel())
}
