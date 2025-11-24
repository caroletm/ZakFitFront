//
//  SignIn.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct SignIn : View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                colors: [.white, .greyLight100],
                startPoint: .top,
                endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            VStack {
                Image(.logoZakFit)
                
                if let errorMessage = authVM.errorMessage {
                    Text(errorMessage)
                        .padding(20)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.red)
                }
                
                TextFieldUsername()
                TextFieldEmail()
                TextFieldPassword()
                TextFieldPasswordConfirm()
                
                BoutonOrange(text: "S'inscrire", width: 280, height: 47) {
                    authVM.isAuthenticated = true
                    navigationVM.path.append(AppRoute.profilOnboarding)
                }
                
                Text("Déjà un compte?")
                    .font(.system(size: 14))
                    .padding()
                
                BoutonSouligne(text: "Connectez-vous", color: .orangeLight300, fontSize: 18, fontWeight: .bold) {
                    withAnimation {
                        authVM.showSignIn = false
                        authVM.showLogin = true
                    }
                }
            }
        }
    }
}

#Preview {
    SignIn()
        .environment(AuthViewModel())
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}


