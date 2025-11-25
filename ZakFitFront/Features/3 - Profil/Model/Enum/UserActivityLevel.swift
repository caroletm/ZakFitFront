//
//  UserActivityLevel.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

enum UserActivityLevel: String, CaseIterable {
    
    case parDefault
    case low
    case moderate
    case high
    case veryHigh

    
    var description: String {
        switch self {
        case .parDefault:
            return "-"
        case .low:
            return "Peu actif"
        case .moderate:
            return "Modéré"
        case .high:
            return "Actif"
        case .veryHigh:
            return "Très actif"
        }
    }
}
