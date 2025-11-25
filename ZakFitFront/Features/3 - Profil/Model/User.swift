//
//  User.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import Foundation

class User : Identifiable,Hashable {
    var id : UUID = UUID()
    var image : String
    var username : String
    var email : String
    var motDePasse : String
    var nom : String
    var prenom : String
    var taille : Int
    var poids : Int
    var sexe : UserGender
    var dateNaissance : Date
    var age : Int
    var foodPreferences : UserPreferences
    var activityLevel : UserActivityLevel
    
    init(id: UUID, image: String, username: String, email: String, motDePasse: String, nom: String, prenom: String, taille: Int, poids: Int, sexe: UserGender, dateNaissance : Date, age: Int, foodPreferences : UserPreferences, activityLevel : UserActivityLevel) {
        self.id = id
        self.image = image
        self.username = username
        self.email = email
        self.motDePasse = motDePasse
        self.nom = nom
        self.prenom = prenom
        self.taille = taille
        self.poids = poids
        self.sexe = sexe
        self.dateNaissance = dateNaissance
        self.age = age
        self.foodPreferences = foodPreferences
        self.activityLevel = activityLevel
    }
    
    // MARK: - Hashable
static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
// MARK: - User Fake Database

let firstUser = User(id: UUID(), image: "profilGrey",username: "caroletrem", email: "carole.trem@email.com", motDePasse: "cacao123", nom: "Trem", prenom: "Carole", taille: 155, poids: 59, sexe: .female, dateNaissance: Date(), age: 33, foodPreferences: .none, activityLevel: .high)
