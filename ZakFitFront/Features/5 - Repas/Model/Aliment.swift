//
//  Aliment.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI
import Foundation

class Aliment : Identifiable, Hashable {
    var id : UUID = UUID()
    var nom : String
    var portion : Portion
    var calories : Int
    var proteines : Double
    var glucides : Double
    var lipides : Double
    
    init(nom: String, portion: Portion, calories: Int, proteines: Double, glucides: Double, lipides: Double) {
        self.nom = nom
        self.portion = portion
        self.calories = calories
        self.proteines = proteines
        self.glucides = glucides
        self.lipides = lipides
    }
    
    // MARK: - Hashable
static func == (lhs: Aliment, rhs: Aliment) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
