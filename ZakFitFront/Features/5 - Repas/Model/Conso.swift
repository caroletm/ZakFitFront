//
//  Conso.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI
import Foundation

class Conso : Identifiable, Hashable {
    var id : UUID = UUID()
    var aliment : String
    var portion: Portion
    var quantite : Int
    var calories : Double
    var glucides : Double
    var proteines : Double
    var lipides : Double
    
    init(aliment : String, portion: Portion, quantite: Int, calories: Double, proteines: Double, glucides: Double, lipides: Double) {
        self.aliment = aliment
        self.portion = portion
        self.quantite = quantite
        self.calories = calories
        self.proteines = proteines
        self.glucides = glucides
        self.lipides = lipides
    }
    
    // MARK: - Hashable
static func == (lhs: Conso, rhs: Conso) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let conso1 : ConsoDTO = ConsoDTO(aliment: "Frites", portion: .unite, quantite: 1, calories: 42, proteines: 0.2, glucides: 21, lipides: 0.1)
