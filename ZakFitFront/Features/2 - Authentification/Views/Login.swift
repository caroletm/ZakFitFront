//
//  Login.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Login : View {
    
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        
//        @Bindable var authVM = authVM
        
        ZStack {
            LinearGradient(
                colors: [.white, .greyLight100, .greyDark],
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
                Spacer()
                    .frame(height : 15)
                
                TextFieldPassword()
                
                HStack {
                    HStack {
                        Button {
                            authVM.rememberMe.toggle()
                        }label: {
                            HStack(spacing: 8) {
                                Image(systemName: authVM.rememberMe ? "checkmark.square.fill" : "square")
                                    .foregroundColor(authVM.rememberMe ? .orangeLight300 : .greyDark)
                                    .font(.system(size: 18))
                                
                                Text("Se souvenir de moi")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                    
                    BoutonSouligne(text: "Mot de passe oublié?", color: .black, fontSize: 14, fontWeight: .regular) {
                        //
                    }
                }
                BoutonOrange(text: "Se connecter", width: 280, height: 47) {
                    //
                }
                
                Text("Vous n'avez pas de compte?")
                    .font(.system(size: 14))
                    .padding()
                
                BoutonSouligne(text: "Inscrivez-vous", color: .orangeLight50, fontSize: 18, fontWeight: .bold) {
                    withAnimation {
                        authVM.showSignIn = true
                        authVM.showLogin = false
                    }
                }
            }
        }
    }
}

#Preview {
    Login()
        .environment(AuthViewModel())
}



