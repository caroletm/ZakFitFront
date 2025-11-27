//
//  TypeRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

enum TypeRepas: String, CaseIterable {
    
    case petitDejeuner
    case dejeuner
    case diner
    case encas
    
    var label: String {
        switch self {
        case .petitDejeuner:
            return "Petit-déjeuner"
        case .dejeuner:
            return "Déjeuner"
        case .diner:
            return "Dîner"
        case .encas:
            return "Encas"
        }
    }
}
