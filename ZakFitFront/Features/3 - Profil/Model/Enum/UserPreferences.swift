//
//  UserPreferences.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

enum UserPreferences: String, CaseIterable {
    case parDefault
    case vegetarian
    case vegan
    case glutenFree
    case lactoseIntolerant
    case none

    
    var description: String {
        switch self {
        case .parDefault:
            return "-"
        case .vegetarian:
            return "Vegetarien"
        case .vegan:
            return "Vegan"
        case .glutenFree:
            return "Sans gluten"
        case .lactoseIntolerant:
            return "Sans lactose"
        case .none:
            return "Aucune restriction"
        }
    }
}
