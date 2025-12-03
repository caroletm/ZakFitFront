//
//  RepasDTO.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct RepasDTO: Codable, Hashable {
    var id : UUID?
    var typeRepas : TypeRepas
    var date : Date
    var calories : Double
    var consos : [ConsoDTO]
}
