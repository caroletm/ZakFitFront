//
//  EnumNotif.swift
//  ZakFitFront
//
//  Created by caroletm on 04/12/2025.
//

import Foundation

enum NotifType: String, Codable {
    case repas
    case activite
}

enum NotifCategorie : String, Codable {
    case alerte
    case motivation
    case suggestion
    case rappel
    
    var image : String {
        switch self {
        case .alerte:
            return "exclamationmark.triangle"
        case .motivation:
            return "flame"
        case .suggestion:
            return "lightbulb"
        case .rappel:
            return "clock"
        }
    }
    
    var textNotifRepas : String {
        switch self {
        case .alerte:
            return "Avez vous pensé à rentrer vos repas aujourd'hui ?"
        case .motivation:
            return "Un petit écart ne fait pas tout un échec. Reprenez demain avec encore plus d'énergie !"
        case .suggestion:
            return "Vous n'avez pas encore atteint votre objectif de calories pour la journée. Repensez à manger des légumes et des fruits !"
        case .rappel:
            return "Vous avez dépassé votre objectif de calories pour la journée."
        }
    }
    
    var textNotifActivite : String {
        switch self {
        case .alerte:
            return "Avez vous pensé à rentrer vos activités aujourd'hui ?"
        case .motivation:
            return "Prenez le temps de faire un peu de sport! Vous allez vous sentir mieux !"
        case .suggestion:
            return "Vous n'avez pas encore atteint votre objectif minutes d'activité pour la journée. Faites une petite balade !"
        case .rappel:
            return "Cela fait un moment que vous n'avez pas fait d'activité. Prenez un peu de temps pour vous ressourcer !"
        }
    }
}
