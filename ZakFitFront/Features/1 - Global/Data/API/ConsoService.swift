//
//  ConsoService.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct ConsoService {
    func getAllConsos() async throws -> [ConsoDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activitesFetch: [ConsoDTO] = try await APIService.shared.get("/conso", token : token)
        return activitesFetch
    }
    
    func getConsoById(_ id: UUID) async throws -> ConsoDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        
        let activiteFetch: ConsoDTO = try await APIService.shared.get("/conso/\(id)", token : token)
        return activiteFetch
    }
    
    func createConso(_ dto: ConsoDTO) async throws -> ConsoDTO {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activiteCreated: ConsoDTO = try await APIService.shared.post("/conso", body: dto, token: token)
        return activiteCreated
    }
    
//        func deleteActivite(_ id: UUID, dto: ActiviteUpdateDTO) async throws -> ActiviteDTO {
//            return try await APIService.shared.delete("/objectif/\(id)", body: dto)
//        }
}
