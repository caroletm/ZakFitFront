//
//  UniteDuree.swift
//  ZakFitFront
//
//  Created by caroletm on 25/11/2025.
//

enum UniteDuree: String, CaseIterable {
    case jours
    case semaines
    case mois
    
    var description: String {
        switch self {
        case .jours:
            return "jours"
        case .semaines:
            return "semaines"
        case .mois:
            return "mois"
        }
    }
}
