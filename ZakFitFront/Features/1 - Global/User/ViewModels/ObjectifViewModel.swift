//
//  ObjectifViewModel.swift
//  ZakFitFront
//
//  Created by caroletm on 25/11/2025.
//

import Foundation
import SwiftUI
import Observation

@Observable

class ObjectifViewModel {
    
    var userVM : UserViewModel
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
    
    //MARK: - Objectifs
    
    //Objectifs Repas :
    var objectifGlobal : UserObjectifGlobal = .parDefault
    
    var poidsCible : Double? = nil
    
    var showPicker : Bool = false
    var caloriesParJour : Int? = nil
    
    //Objectifs Activites :
    var caloriesBruleesParJour : Int? = nil
    var dureeActivite : Int? = nil
    var nbEntrainementsHebdo : Int? = nil
    
    //MARK: - Objectifs de poids duree
    
    var nbDuree : Int? = nil
    var uniteDuree : UniteDuree? = nil
    var dateDebut : Date = Date()
    
    func dureeEnJours() -> Int? {
        guard let nb = nbDuree, let unite = uniteDuree else { return nil }
        switch unite {
        case .jours:
            return nb
        case .semaines:
            return nb * 7
        case .mois:
            return nb * 30
        }
    }
    
    func dateCible() -> Date? {
        guard let jours = dureeEnJours() else { return nil }
        return Calendar.current.date(byAdding: .day, value: jours, to: dateDebut)
    }
    
    //MARK: - Objectifs de calories
    
//    La formule de Harris et Benedict est la plus ancienne, et assure une idée claire des dépenses caloriques à 150kcal près.
//    Femmes : 655 + (9,6 x poids (Kg)) + (1,8 x taille (cm)) – (4,7 x âge)
//    Hommes : 66 + (13,7 x poids (Kg)) + (5 x taille (cm)) – (6,5 x âge)
    
    func caloriesCiblesCalculees() -> Int {
        guard let poids = userVM.poids,
              let taille = userVM.taille,
              let age = userVM.age
        else {
            return 0
        }
        
        let activityLevel = userVM.activityLevel
        let activityFactor : Double
        
        switch activityLevel {
        case .low:
            activityFactor = 1.2
        case .moderate:
            activityFactor = 1.375
        case .high:
            activityFactor = 1.55
        case .veryHigh:
            activityFactor = 1.725
        default:
            activityFactor = 1.0
        }
        
        let objectifGlobal = objectifGlobal
        let objectifGlobalFactor : Double
        switch objectifGlobal {
            case .perte:
            objectifGlobalFactor = 0.8
            case .gain:
            objectifGlobalFactor = 1.2
        case .maintien:
            objectifGlobalFactor = 1.0
        default:
            objectifGlobalFactor = 1.0
        }
        
        if userVM.sexe == .female {
            let result = 655.0 + (9.6 * poids) + (1.8 * Double(taille)) - (4.7 * Double(age))
            return Int(result * activityFactor * objectifGlobalFactor)
        } else {
            let result = 66.0 + (13.7 * poids) + (5.0 * Double(taille)) - (6.5 * Double(age))
            return Int(result * activityFactor * objectifGlobalFactor)
        }
    }
    
    func caloriesCiblesBruleesCalculees() -> Int {
        guard let poids = userVM.poids,
              let taille = userVM.taille,
              let age = userVM.age
        else {
            return 0
        }
        
        let activityLevel = userVM.activityLevel
        let activityFactor : Double
        
        switch activityLevel {
        case .low:
            activityFactor = 1.2
        case .moderate:
            activityFactor = 1.375
        case .high:
            activityFactor = 1.55
        case .veryHigh:
            activityFactor = 1.725
        default:
            activityFactor = 1.0
        }
        
        if userVM.sexe == .female {
            let result = 655.0 + (9.6 * poids) + (1.8 * Double(taille)) - (4.7 * Double(age))
            return Int(result * activityFactor)
        } else {
            let result = 66.0 + (13.7 * poids) + (5.0 * Double(taille)) - (6.5 * Double(age))
            return Int(result * activityFactor)
        }
    }
    
}
