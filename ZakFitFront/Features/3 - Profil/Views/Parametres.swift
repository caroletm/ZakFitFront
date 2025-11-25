//
//  Parametres.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Parametres : View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                VStack (alignment :.leading, spacing : 20) {
                    Text("Général")
                        .font(.system(size: 20, weight: .bold))
                    Button {
                        navigationVM.path.append(AppRoute.profilOnboarding)
                    }label:{
                        Text("Modifier mon profil")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(Color.black)
                    }
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
                        Toggle("", isOn: $userVM.isNotificationActive)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: .orangeLight300))
                    }
                    
                    Text("Confidentialité")
                        .font(.system(size: 16, weight: .medium))
                    Text("Conditions Générales d'utilisation")
                        .font(.system(size: 16, weight: .medium))
                    Text("Supprimer mon compte")
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
        .environment(UserViewModel())
}
