//
//  RepasService.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct RepasService {
    func getAllRepas() async throws -> [RepasDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activitesFetch: [RepasDTO] = try await APIService.shared.get("/repas", token : token)
        return activitesFetch
    }
    
    func getRepasById(_ id: UUID) async throws -> RepasDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        
        let activiteFetch: RepasDTO = try await APIService.shared.get("/repas/\(id)", token : token)
        return activiteFetch
    }
    
    func createRepas(_ dto: RepasDTO) async throws -> RepasDTO {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activiteCreated: RepasDTO = try await APIService.shared.post("/repas", body: dto, token: token)
        return activiteCreated
    }
    
//        func deleteActivite(_ id: UUID, dto: ActiviteUpdateDTO) async throws -> ActiviteDTO {
//            return try await APIService.shared.delete("/objectif/\(id)", body: dto)
//        }
}
