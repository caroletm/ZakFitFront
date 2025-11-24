//
//  TextfieldUsername.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct TextFieldUsername: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM

    var body: some View {
        @Bindable var userVM = userVM

        TextField("Nom d'utilisateur", text: $userVM.nomUtilisateur)
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
    TextFieldUsername()
        .environment(AuthViewModel())
        .environment(UserViewModel())
}
