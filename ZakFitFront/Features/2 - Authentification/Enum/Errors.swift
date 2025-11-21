//
//  Errors.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import Foundation

enum Errors: Error {
    case motDePasseIncorrect
    case emailInvalide
    case pasDeConnexion
    case motsDePassesDifferents
    case motDePasseInvalide
    
    var errorDescription: String {
        switch self {
        case .motDePasseIncorrect:
            return "Le mot de passe est incorrect."
        case .emailInvalide:
            return "L'email est invalide."
        case .pasDeConnexion:
            return "Pas de connexion."
        case .motsDePassesDifferents:
            return "Les mots de passe doivent être identiques."
        case .motDePasseInvalide:
            return "Le mot de passe doit contenir au moins 8 caractères"
        }
    }
}
