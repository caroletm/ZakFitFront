//
//  UserObjectifGlobal.swift
//  ZakFitFront
//
//  Created by caroletm on 25/11/2025.
//

enum UserObjectifGlobal: String, CaseIterable {
    case parDefault
    case perte
    case gain
    case maintien


    var description: String {
        switch self {
        case .parDefault:
            return "-"
        case .perte:
            return "Perte de poids"
        case .gain:
            return "Prise de masse"
        case .maintien:
            return "Maintien du poids"
        }
    }
}
