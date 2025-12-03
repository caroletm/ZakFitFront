//
//  AlimentService.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//
import Foundation

struct AlimentService {
    func getAllAliment() async throws -> [AlimentDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activitesFetch: [AlimentDTO] = try await APIService.shared.get("/aliment", token : token)
        return activitesFetch
    }
    
    func getAlimentById(_ id: UUID) async throws -> AlimentDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        
        let activiteFetch: AlimentDTO = try await APIService.shared.get("/aliment/\(id)", token : token)
        return activiteFetch
    }
    
    func createAliment(_ dto: AlimentDTO) async throws -> AlimentDTO {
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let activiteCreated: AlimentDTO = try await APIService.shared.post("/aliment", body: dto, token: token)
        return activiteCreated
    }
    
//        func deleteActivite(_ id: UUID, dto: ActiviteUpdateDTO) async throws -> ActiviteDTO {
//            return try await APIService.shared.delete("/objectif/\(id)", body: dto)
//        }
}
