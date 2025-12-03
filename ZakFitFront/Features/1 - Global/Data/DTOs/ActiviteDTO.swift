//
//  ActiviteDTO.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct ActiviteDTO: Codable, Hashable {
    var id: UUID?
    var typeActivite: TypeActivite
    var date: Date
    var duree: Int
    var caloriesBrulees: Double
}

struct ActiviteUpdateDTO: Codable {
    var typeActivite: TypeActivite?
    var date: Date?
    var duree: Int?
    var caloriesBrulees: Double?
}
