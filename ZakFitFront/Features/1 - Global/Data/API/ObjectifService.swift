//
//  ObjectifService.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//
import Foundation

struct ObjectifService {
    func getAllObjectifs() async throws -> [ObjectifDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let objectifsFetch: [ObjectifDTO] = try await APIService.shared.get("/objectif", token : token)
        return objectifsFetch
    }

    func getObjectifById(_ id: UUID) async throws -> ObjectifDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        
        let objectifFetch: ObjectifDTO = try await APIService.shared.get("/objectif/\(id)", token : token)
        return objectifFetch
    }

    func createObjectif(_ dto: ObjectifDTO) async throws -> ObjectifDTO {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let objectifCreated: ObjectifDTO = try await APIService.shared.post("/objectif", body: dto, token: token)
        return objectifCreated
    }
    
    func deleteAllObjectifs() async throws {
        try await APIService.shared.delete("/objectif")
    }

}
