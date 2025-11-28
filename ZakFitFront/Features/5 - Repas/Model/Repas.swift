//
//  Repas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI
import Foundation

class Repas : Identifiable, Hashable {
    var id : UUID = UUID()
    var typeRepas : TypeRepas
    var date : Date
    var calories : Double
    var consos : [Conso] = []
    
    init(id: UUID, typeRepas: TypeRepas, date: Date, calories: Double, consos: [Conso]) {
        self.id = id
        self.typeRepas = typeRepas
        self.date = date
        self.calories = calories
        self.consos = consos
    }
    
    // MARK: - Hashable
static func == (lhs: Repas, rhs: Repas) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let repas1 : Repas = Repas(id: UUID(), typeRepas: .dejeuner, date: Date(), calories: 1000, consos: [conso1, conso1, conso1])
