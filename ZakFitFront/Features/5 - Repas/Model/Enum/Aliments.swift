//
//  Aliments.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

enum Aliments: String, CaseIterable, Codable, Hashable {
    case parDefault
    case pomme
    case banane
    case yaourt
    case pain
    case cafe
    case pates
    case frites
    case viande
    case poisson
    case chocolat
    case lait
    case eau
    case carotte
    case haricot
    
    var description: String {
        switch self {
        case .parDefault:
            return "-"
        case .pomme:
            return "Pomme"
        case .banane:
            return "Banane"
        case .yaourt:
            return "Yaourt"
        case .pain:
            return "Pain"
        case .cafe:
            return "Cafe"
        case .pates:
            return "Pates"
        case .frites:
            return "Frites"
        case .viande:
            return "Viande"
        case .poisson:
            return "Poisson"
        case .chocolat:
            return "Chocolat"
        case .lait:
            return "Lait"
        case .eau:
            return "Eau"
        case .carotte:
            return "Carotte"
        case .haricot:
            return "Haricot"
        }
    }
}

struct Nutriments {
    let calories: Int
    let proteines: Double
    let glucides: Double
    let lipides: Double
}

extension Aliments {
    var nutriments: Nutriments {
        switch self {
        case .pomme:
            return Nutriments(calories: 78, proteines: 0.4, glucides: 21, lipides: 0.3)
        case .banane:
            return Nutriments(calories: 108, proteines: 1.3, glucides: 28, lipides: 0.3)
        case .yaourt:
            return Nutriments(calories: 75, proteines: 4, glucides: 6, lipides: 3)
        case .pain:
            return Nutriments(calories: 80, proteines: 2.7, glucides: 15, lipides: 1)
        case .cafe:
            return Nutriments(calories: 2, proteines: 0.3, glucides: 0, lipides: 0)
        case .pates:
            return Nutriments(calories: 131, proteines: 5, glucides: 25, lipides: 1.1)
        case .frites:
            return Nutriments(calories: 312, proteines: 3.4, glucides: 41, lipides: 15)
        case .viande:
            return Nutriments(calories: 250, proteines: 26, glucides: 0, lipides: 15)
        case .poisson:
            return Nutriments(calories: 206, proteines: 22, glucides: 0, lipides: 12)
        case .chocolat:
            return Nutriments(calories: 546, proteines: 4.9, glucides: 61, lipides: 31)
        case .lait:
            return Nutriments(calories: 60, proteines: 3.2, glucides: 4.8, lipides: 3.3)
        case .eau:
            return Nutriments(calories: 0, proteines: 0, glucides: 0, lipides: 0)
        case .carotte:
            return Nutriments(calories: 41, proteines: 0.9, glucides: 10, lipides: 0.2)
        case .haricot:
            return Nutriments(calories: 31, proteines: 1.8, glucides: 7, lipides: 0.1)
        default:
            return Nutriments(calories: 0, proteines: 0, glucides: 0, lipides: 0)
        }
    }
}
