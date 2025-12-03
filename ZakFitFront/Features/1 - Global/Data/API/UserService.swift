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
    
    init() {}
    
    // Inscription
    func signUp(image : String, username: String, email: String, motDePasse: String, nom : String, prenom: String, taille : Int, poids : Double, dateNaissance : Date, sexe: UserGender, foodPreferences : UserPreferences, activityLevel: UserActivityLevel ) async throws -> UserDTO {
        
        let body = UserCreateDTO(image: image, username: username, email: email, motDePasse: motDePasse, nom: nom, prenom: prenom, taille: taille, poids: poids, dateNaissance: dateNaissance, sexe: sexe, foodPreferences: foodPreferences, activityLevel: activityLevel)
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
    
    //Modifier la data du profil user
    func updateDataUser(_ id: UUID, dto: UserUpdateDTO) async throws -> UserDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        return try await api.patch("/users/\(id)", body: dto, token : token)
    }
    
    func getUserById(_ id: UUID) async throws -> UserDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        
        let userGet: UserDTO = try await APIService.shared.get("/users/\(id)", token : token)
        return userGet
        
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
