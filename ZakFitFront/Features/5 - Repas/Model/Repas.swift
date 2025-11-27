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
    var calories : Int
    
    init(id: UUID, typeRepas: TypeRepas, date: Date, calories: Int) {
        self.id = id
        self.typeRepas = typeRepas
        self.date = date
        self.calories = calories
    }
    
    // MARK: - Hashable
static func == (lhs: Repas, rhs: Repas) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
