//
//  UserViewModel.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import Foundation
import SwiftUI
import Observation

@Observable

class UserViewModel {
    
    //MARK: - DataUser
    
    var nomUtilisateur: String = ""
    var motDePasse: String = ""
    var email: String = ""
    var image : String? = nil
    var nom = ""
    var prenom = ""
    var taille = 155
    var poids = 59
    var sexe : UserGender? = nil
    var dateNaissance : Date = Date()
    var age : Int = 33
    var preference : UserPreferences = .none
    var activityLevel : UserActivityLevel = .moderate
    
    //MARK: - Objectifs
    
    //Objectifs Repas :
    var dateDebut : Date = Date()
    var poidsCible : Double? = 55
    var nbDuree : Int? = 12
    var uniteDuree : String? = "semaine"
    var showPicker : Bool = false
    var caloriesParJourString : String = "1500"
    var caloriesParJour : Int? = 1500
    
    //Objectifs Activites :
    var caloriesBruleesParJourString : String = "1500"
    var caloriesBruleesParJour : Int? = 1500
    var dureeActiviteString : String = "30"
    var dureeActivite : Int? = 30
    var nbEntrainementsHebdoString : String = "3"
    var nbEntrainementsHebdo : Int? = 3
}
