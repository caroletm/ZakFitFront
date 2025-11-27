//
//  Aliments.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

enum Aliments: String, CaseIterable {
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
