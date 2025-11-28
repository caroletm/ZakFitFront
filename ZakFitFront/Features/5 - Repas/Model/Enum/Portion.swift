//
//  Portion.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

enum Portion: String, CaseIterable {
    
    case parDefault
    case unite
    case cuillere
    case verre
    case tasse
    case tranche
    case gramme
    case kilo
    case litre
    case mililitre
    
    var description: String {
        switch self {
            case .parDefault:
            return ""
        case .unite:
            return "unité"
        case .cuillere:
            return "cuillère"
        case .verre:
            return "verre"
        case .tasse:
            return "tasse"
        case .tranche:
            return "tranche"
        case .gramme:
            return "g"
        case .kilo:
            return "kg"
        case .litre:
            return "l"
        case .mililitre:
            return "ml"
        }
    }
}
