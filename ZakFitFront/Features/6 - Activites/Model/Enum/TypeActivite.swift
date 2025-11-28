//
//  TypeActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

enum TypeActivite: String, CaseIterable {
    case courseAPied
    case musculation
    case velo
    case yoga
    case tennis
    case danse
    case basket
    case marche
    case natation
    case football
    
    var description: String {
        switch self {
        case .courseAPied:
            return "Course à pied"
        case .musculation:
            return "Musculation"
        case .velo:
            return "Vélo"
        case .yoga:
            return "Yoga"
        case .tennis:
            return "Tennis"
        case .danse:
            return "Danse"
        case .basket:
            return "Basket"
        case .marche:
            return "Marche"
        case .natation:
            return "Natation"
        case .football:
            return "Football"
        }
    }
    
    var imageName: String {
        switch self {
        case .courseAPied:
            return "figure.run"
        case .musculation:
            return "dumbbell.fill"
        case .velo:
            return "figure.outdoor.cycle"
        case .yoga:
            return "figure.mind.and.body"
        case .tennis:
            return "figure.tennis"
        case .danse:
            return "figure.dance"
        case .basket:
            return "figure.basketball"
        case .marche:
            return "figure.walk"
        case .natation:
            return "figure.open.water.swim"
        case .football:
            return "figure.indoor.soccer"
        }
    }
    
    var MET: Double {
        switch self {
        case .courseAPied:
            return 10.0
        case .musculation:
            return 6.0
        case .velo:
            return 8.0
        case .yoga:
            return 3.0
        case .tennis:
            return 7.0
        case .danse:
            return 6.0
        case .basket:
            return 8.0
        case .marche:
            return 3.3
        case .natation:
            return 8.0
        case .football:
            return 8.0
        }
    }
}
