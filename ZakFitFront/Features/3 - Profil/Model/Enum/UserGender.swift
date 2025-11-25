//
//  UserGender.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

enum UserGender: String, CaseIterable {
    case male
    case female
    case other

    var description: String {
        switch self {
        case .male:
            return "Homme"
        case .female:
            return "Femme"
        case .other:
            return "Autre"
        }
    }
}
