//
//  ActiviteService.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct ActiviteService {
    func getAllActivites() async throws -> [ActiviteDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activitesFetch: [ActiviteDTO] = try await APIService.shared.get("/activite", token : token)
        return activitesFetch
    }
    
    func getActiviteById(_ id: UUID) async throws -> ActiviteDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        
        let activiteFetch: ActiviteDTO = try await APIService.shared.get("/activite/\(id)", token : token)
        return activiteFetch
    }
    
    func createActivite(_ dto: ActiviteDTO) async throws -> ActiviteDTO {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activiteCreated: ActiviteDTO = try await APIService.shared.post("/activite", body: dto, token: token)
        return activiteCreated
    }
    
//        func deleteActivite(_ id: UUID, dto: ActiviteUpdateDTO) async throws -> ActiviteDTO {
//            return try await APIService.shared.delete("/objectif/\(id)", body: dto)
//        }
}
