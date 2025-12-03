//
//  TextFieldPassword.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TextFieldPassword: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM
        
        HStack {
            if authVM.isPasswordVisible {
                TextField("Mot de passe", text: $userVM.motDePasse)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
            } else {
                SecureField("Mot de passe", text: $userVM.motDePasse)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Button {
                authVM.isPasswordVisible.toggle()
            }label: {
                Image(systemName: authVM.isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(authVM.isPasswordVisible ? .black : .greyLight100)
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
    }
}

#Preview {
    let userVM = UserViewModel()
    TextFieldPassword()
        .environment(userVM)
        .environment(AuthViewModel(userVM: userVM))
    
}



