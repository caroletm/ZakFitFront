//
//  AuthViewModel.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable

class AuthViewModel {
    
    //MARK: - DataUser
    
    var errorMessage: String? = "Mot de passe incorrect. Veuillez réessayer."
//    var nomUtilisateur: String = ""
    var motDePasse: String = ""
    var motDePasseConfirm: String = ""
//    var email: String = ""
    
    //MARK: - Etats d'affichage
    
    var isPasswordVisible: Bool = false
    var rememberMe: Bool = false
    var showLanding : Bool = true
    var showLogin : Bool = true
    var showSignIn : Bool = true
    
    //MARK: - Etats d'authentification
    
    var isAuthenticated: Bool = false
    var firstConnection: Bool = false
}
