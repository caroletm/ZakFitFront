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
    var email: String = ""
    var motDePasse: String = ""
    var motDePasseConfirm: String = ""
    var image : String? = nil
    var nom = ""
    var prenom = ""
    var taille : Int? = nil
    var poids : Double? = 59 // achanger en nil
    var sexe : UserGender? = nil
    var dateNaissance : Date = Date()
    var age: Int? {
        Calendar.current.dateComponents([.year], from: dateNaissance, to: Date()).year ?? 0
    }
    var preference : UserPreferences = UserPreferences.parDefault
    var activityLevel : UserActivityLevel = .parDefault
    var isNotificationActive : Bool = true
    
    //MARK: - Date
    
    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
