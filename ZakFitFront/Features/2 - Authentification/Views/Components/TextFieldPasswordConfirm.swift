//
//  TextFieldPassword.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TextFieldPasswordConfirm: View {
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        
        @Bindable var authVM = authVM
        
        HStack {
            if authVM.isPasswordVisible {
                TextField("Confirmez le mot de passe", text: $authVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
            } else {
                SecureField("Confirmez le mot de passe", text: $authVM.motDePasseConfirm)
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
    TextFieldPasswordConfirm()
        .environment(AuthViewModel())
}



