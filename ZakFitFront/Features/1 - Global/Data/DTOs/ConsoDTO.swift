//
//  ConsoDTO.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct ConsoDTO: Codable, Hashable {
    var id : UUID?
    var aliment : String
    var portion: Portion
    var quantite : Int
    var calories : Double
    var proteines : Double
    var glucides : Double
    var lipides : Double
}
