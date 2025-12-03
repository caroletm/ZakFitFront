//
//  UserDTO.swift
//  ZakFitFront
//
//  Created by caroletm on 02/12/2025.
//

import Foundation

// signup
struct UserCreateDTO: Codable {
    var image: String
    var username: String
    var email: String
    var motDePasse: String
    var nom: String
    var prenom: String
    var taille: Int
    var poids: Double
    var dateNaissance: String
    var sexe: UserGender
    var foodPreferences: UserPreferences
    var activityLevel: UserActivityLevel
}

//login
struct LoginRequest: Codable {
    let email: String
    let motDePasse: String
}

//  réponse user
struct UserDTO: Codable, Identifiable {
    var id: UUID?
    var image: String
    var username: String
    var email: String
    var nom: String
    var prenom: String
    var taille: Int
    var poids: Double
    var sexe: UserGender
    var dateNaissance: Date
    var foodPreferences: UserPreferences
    var activityLevel: UserActivityLevel
}

// Réponse du login (token)
struct LoginResponse: Codable {
    let token: String
}
//  PATCH
struct UserUpdateDTO: Codable {
    var image : String?
    var username : String?
    var email : String?
    var motDePasse : String?
    var nom : String?
    var prenom : String?
    var taille : Int?
    var poids : Double?
    var sexe : UserGender?
    var dateNaissance : String?
    var foodPreferences : UserPreferences?
    var activityLevel : UserActivityLevel?
}

