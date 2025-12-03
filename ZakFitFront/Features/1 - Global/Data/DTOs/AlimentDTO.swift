//
//  AlimentDTO.swift
//  ZakFitFront
//
//  Created by caroletm on 03/12/2025.
//

import Foundation

struct AlimentDTO: Codable,Hashable {
    var id : UUID?
    var nom : String
    var portion : Portion
    var calories : Double
    var proteines : Double
    var glucides : Double
    var lipides : Double
}
