//
//  TextFieldPassword.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TextFieldPasswordConfirm: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
        
    var body: some View {
        
        @Bindable var userVM = userVM
        @Bindable var authVM = authVM
        
        HStack {
            if authVM.isPasswordConfirmVisible {
                TextField("Confirmez le mot de passe", text: $userVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
            } else {
                SecureField("Confirmez le mot de passe", text: $userVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Button {
                authVM.isPasswordConfirmVisible.toggle()
            }label: {
                Image(systemName: authVM.isPasswordConfirmVisible ? "eye.slash" : "eye")
                    .foregroundColor(authVM.isPasswordConfirmVisible ? .black : .greyLight100)
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
    TextFieldPasswordConfirm()
        .environment(userVM)
        .environment(AuthViewModel(userVM: userVM))
}



