//
//  TextFieldPassword.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TextFieldPassword: View {
    @Environment(AuthViewModel.self) var authVM
    
    @State var isPasswordVisible: Bool = false
    
    var body: some View {
        
        @Bindable var authVM = authVM
        
        HStack {
            if authVM.isPasswordVisible {
                TextField("Mot de passe", text: $authVM.motDePasse)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
            } else {
                SecureField("Mot de passe", text: $authVM.motDePasse)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Button {
                isPasswordVisible.toggle()
            }label: {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(isPasswordVisible ? .black : .greyLight100)
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
    TextFieldPassword()
        .environment(AuthViewModel())
}



