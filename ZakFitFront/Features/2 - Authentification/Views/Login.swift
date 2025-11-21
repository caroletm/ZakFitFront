//
//  Login.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Login : View {
    
    @Environment(AuthViewModel.self) var authVM
    
    @State var errorMessage: String? = "Mot de passe incorrect. Veuillez réessayer."
    @State var nomUtilisateur: String = ""
    @State var motDePasse: String = ""
    @State var isPasswordVisible: Bool = false
    @State var rememberMe: Bool = false

    var body: some View {
        
        ZStack {
            LinearGradient(
                colors: [.white, .greyLight100, .greyDark],
                startPoint: .top,
                endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            VStack {
                Image(.logoZakFit)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .padding(20)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.red)
                }
                
                TextField("Nom d'utilisateur", text: $nomUtilisateur)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .font(.system(size: 14))
                    .frame(width: 280)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orangeLight300, lineWidth: 1)
                    )
                Spacer()
                    .frame(height : 15)
                
                HStack {
                    if isPasswordVisible {
                        TextField("Mot de passe", text: $motDePasse)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                          
                    } else {
                        SecureField("Mot de passe", text: $motDePasse)
                        
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }

                    Button {
                        isPasswordVisible.toggle()
                    }label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(isPasswordVisible ? .black : .greyLight200)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(10)
                .frame(width: 280)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orangeLight300, lineWidth: 1)
                )
                
                HStack {
                    HStack {
                        Button {
                            rememberMe.toggle()
                        }label: {
                            HStack(spacing: 8) {
                                Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                    .foregroundColor(rememberMe ? .orangeLight300 : .greyDark)
                                    .font(.system(size: 18))
                                
                                Text("Se souvenir de moi")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                    Button {
                        //
                    }label :{
                        Text("Mot de passe oublié?")
                            .font(.custom("SFPro-Regular", size: 14))
                            .foregroundStyle(Color.black)
                            .underline()
                    }
                }
                Button {
                    //
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 280, height: 47)
                            .foregroundStyle(Color.orangeLight300)
                        Text("Se connecter")
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                            .fontWeight(.bold)
                    }
                }
                .padding()
                
                Text("Vous n'avez pas de compte?")
                    .font(.system(size: 14))
                    .padding()
                
                Button {
                    //
                }label: {
                    Text("Inscrivez-vous")
                        .foregroundStyle(Color.orangeLight50)
                        .font(.system(size: 18, weight: .bold))
                        .underline()
                }
            }
        }
    }
}

#Preview {
    Login()
        .environment(AuthViewModel())
}
