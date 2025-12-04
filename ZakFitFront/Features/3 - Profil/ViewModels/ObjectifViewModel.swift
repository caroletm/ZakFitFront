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
    
    private let service = ObjectifService()
    private let userService = UserService()
    
    // MARK: - User actuel
    var currentUser: UserDTO? = nil
    
    // Récupérer le token
    var authToken: String? {
        UserDefaults.standard.string(forKey: "authToken")
    }
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
    
    //MARK: - Objectifs
    
    var objectifData : [ObjectifDTO] = []
    
    //Objectifs Repas :
    var objectifGlobal : UserObjectifGlobal = .parDefault
    var poidsCible : Double? = nil
    var showPicker : Bool = false
    var caloriesParJour : Double? = nil
    
    //Objectifs Activites :
    var caloriesBruleesParJour : Double? = nil
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
    
    func caloriesCiblesCalculees() -> Double {
        guard let poids = userVM.poids,
              let taille = userVM.taille,
              let age = userVM.age
        else {
            return 0
        }
        
        let activityLevel = userVM.activityLevel
        let objectifGlobal = objectifGlobal
        
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
            return result * activityFactor * objectifGlobalFactor
        } else {
            let result = 66.0 + (13.7 * poids) + (5.0 * Double(taille)) - (6.5 * Double(age))
            return result * activityFactor * objectifGlobalFactor
        }
    }
    
    func caloriesCiblesBruleesCalculees() -> Double {
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
            return result * activityFactor
        } else {
            let result = 66.0 + (13.7 * poids) + (5.0 * Double(taille)) - (6.5 * Double(age))
            return result * activityFactor
        }
    }
    
    //MARK: - Objectifs de macronutriments
    
    var proteines : Double? = nil
    var glucides : Double? = nil
    var lipides : Double? = nil
    
    // 1g lipides = 9 kcal
    // 1g glucides = 4 kcal
    // 1g protéines = 4 kcal
    //    L’ANSES (Agence nationale de sécurité sanitaire de l’alimentation, de l’environnement et du travail) considère que la référence nutritionnelle en protéines des adultes en bonne santé (RNP) est de 0,83 g/kg, de 1 g/kg pour les personnes âgées, et de 1,2 g/kg pour les femmes enceintes ou allaitantes.Dans tous les cas donc, nous conseillons plutôt de viser entre 1,2 à 1,6 g/kg/j de protéines (selon votre âge et votre taux de masse grasse) et de monter jusqu’à 2,2 g/kg/j maximum si vous êtes un sportif de force et/ou que vous êtes en restriction calorique prolongée.
    //    L’ANSES recommande une part de lipides de 35 à 40% de l’apport énergétique total journalier5. Pour un adulte qui consomme en moyenne 2.000 kcal par jour, cela représente entre 78 g et 89 g de lipides par jour.
    //    Une estimation plus grossière de nos besoins consisterait à calculer au minimum 0,8 à 1 g de lipides par kg de poids de corps (soit 80 g si pesez 80 kg).
    //    Selon l’ANSES5, la part de glucides peut varier de 40% des apports (par exemple pour les personnes ayant une activité physique faible) à 55% pour les personnes avec une activité physique plus élevée.
    //    Pour une personne consommant en moyenne 2.000 kcal par jour, cela représente environ 200 à 300 g de glucides.
    //    https://www.nutriting.com/conseils/combien-macronutriments
    
    func lipidesCiblesCalculees() -> Double {
        let caloriesParJour = caloriesCiblesCalculees()
        let resultat = Double(caloriesParJour) * 0.35
        return resultat/9.0
    }
    
    func proteinesCiblesCalculees() -> Double {
        guard let poids = userVM.poids else { return 0 }
        let resultat = poids * 1.2
        return resultat
    }
    
    func glucidesCiblesCalculees() -> Double {
        guard let poids = userVM.poids else { return 0 }
        let resultat = poids * 0.45
        return resultat/4.0
    }
    
    //MARK: - Objectifs d'activité
    
    //    En France, la recommandation diffusée par le ministère chargé de la santé dans le cadre du Programme national nutrition santé (PNNS), est de pratiquer l’équivalent d’au moins 30 minutes de marche rapide par jour au minimum 5 fois par semaine pour les adultes et l’équivalent d’au moins 60 minutes par jour pour les enfants et adolescents.
    
    
    //MARK: - Création de l'objectif
    
    func createObjectif() async {
        let newObjectif : ObjectifDTO = ObjectifDTO(
            id: UUID(),
            objectifGlobal: objectifGlobal,
            dateDebut: Date(),
            dateFin: dateCible() ?? nil,
            typeObjectif: .repas,
            poidsCible: poidsCible,
            caloriesParJour: caloriesParJour ?? caloriesCiblesCalculees(),
            proteines: proteines ?? proteinesCiblesCalculees(),
            glucides: glucides ?? glucidesCiblesCalculees(),
            lipides: lipides ?? lipidesCiblesCalculees(),
            minsActivité: dureeActivite ?? 30,
            caloriesBruleesParJour: caloriesBruleesParJour ?? caloriesCiblesBruleesCalculees(),
            nbEntrainementsHebdo: nbEntrainementsHebdo ?? 5)
        
        objectifData.append(newObjectif)
        
        do {
            _ = try await service.createObjectif(newObjectif)
        }catch{
            print("erreur dans la creation de l'objectif , error : \(error)")
        }
    }
    
    var isValidObjectif : Bool {
        return !objectifData.isEmpty
    }
    
    //MARK: - Call API Back Front
    
    func fetchAllObjectifs() async {
        do {
            let objectifs = try await service.getAllObjectifs()
                  await MainActor.run {
                      self.objectifData = objectifs
                      self.loadFromLastObjectif()
                  }
        }catch{
            print ("erreur dans le chargement des objectifs")
        }
    }
    
    var lastObjectif : ObjectifDTO? {
        return objectifData.last
    }
    
    func loadFromLastObjectif() {
        guard let last = lastObjectif else { return }
        
        self.objectifGlobal = last.objectifGlobal
        self.dateDebut = last.dateDebut
        self.poidsCible = last.poidsCible
        self.caloriesParJour = last.caloriesParJour
        self.proteines = last.proteines
        self.glucides = last.glucides
        self.lipides = last.lipides
        
        self.dureeActivite = last.minsActivité
        self.caloriesBruleesParJour = last.caloriesBruleesParJour
        self.nbEntrainementsHebdo = last.nbEntrainementsHebdo
        
        self.nbDuree = nil        // tu peux déduire la durée si tu veux
        self.uniteDuree = nil     // mais tu ne l’enregistres pas dans ton DTO
    }
    
}
