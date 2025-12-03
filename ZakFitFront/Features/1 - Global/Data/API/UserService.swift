//
//  UserService.swift
//  ZakFitFront
//
//  Created by caroletm on 02/12/2025.
//

import Foundation

final class UserService {
    static let shared = UserService()
    private let api = APIService.shared
    
    private init() {}
    
    // Inscription
    func signUp(image : String, username: String, email: String, motDePasse: String, nom : String, prenom: String, taille : Int, poids : Double, dateNaissance : Date, sexe: UserGender, foodPreferences : UserPreferences, activityLevel: UserActivityLevel ) async throws -> UserDTO {
        
        let formatter = ISO8601DateFormatter()
        let dateString = formatter.string(from: dateNaissance)
        
        let body = UserCreateDTO(image: image, username: username, email: email, motDePasse: motDePasse, nom: nom, prenom: prenom, taille: taille, poids: poids, dateNaissance: dateString, sexe: sexe, foodPreferences: foodPreferences, activityLevel: activityLevel)
        return try await api.post("/users", body: body)
    }
    
    // Connexion
    func login(email: String, motDePasse: String) async throws -> String {
        let body = LoginRequest(email: email, motDePasse: motDePasse)
        // Le endpoint /users/login retourne directement un String (le token)
        let response: LoginResponse = try await api.post("/users/login", body: body)
        return response.token
    }
    
//      profil utilisateur avec le token
    func getProfile(token: String) async throws -> UserDTO {
        guard let url = URL(string: APIService.shared.baseURL + "/users/profile") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder.iso8601Decoder.decode(UserDTO.self, from: data)
    }
    
    //charger les données utilisateur
    let formatter = ISO8601DateFormatter()
    func updateDataUser(
        image : String?,
        nom : String?,
        prenom : String?,
        taille: Int?,
        poids: Double?,
        sexe: UserGender?,
        dateNaissance: Date?,
        foodPreferences: UserPreferences?,
        activityLevel: UserActivityLevel?,
        token: String
       ) async throws -> UserDTO {
           
           let body = UserUpdateDTO(
            image : image,
            nom: nom,
            prenom: prenom,
            taille: taille,
            poids: poids,
            sexe: sexe,
            dateNaissance: dateNaissance != nil ? formatter.string(from: dateNaissance!) : nil,
            foodPreferences: foodPreferences,
            activityLevel: activityLevel
           )
           
           return try await api.patch("/users", body: body, token: token)
       }
    
}
extension JSONDecoder {
    static var iso8601Decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}



//// Inscription
//func signUp(username: String, email: String, password: String) async throws -> UtilisateurDTO {
//    let body = UserCreateDTO(email: email, nom: username, motDePasse: password)
//    return try await api.post("/users", body: body)
//}
//
//// Connexion
//func login(email: String, password: String) async throws -> String {
//    let body = LoginRequest(email: email, motDePasse: password)
//    // Le endpoint /users/login retourne directement un String (le token)
//    let response: LoginResponse = try await api.post("/users/login", body: body)
//    return response.token
//}
//
////      profil utilisateur avec le token
//func getProfile(token: String) async throws -> UtilisateurDTO {
//    return try await api.get("/users/profile", token: token)
//}
//}
