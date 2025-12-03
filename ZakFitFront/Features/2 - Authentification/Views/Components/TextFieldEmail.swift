//
//  TextFieldEmail.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TextFieldEmail: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        @Bindable var userVM = userVM

        TextField("Email", text: $userVM.email)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
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
    }
}

#Preview {
    let userVM = UserViewModel()
    TextFieldEmail()
        .environment(AuthViewModel(userVM: userVM))
        .environment(userVM)
}
