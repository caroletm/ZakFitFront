//
//  Activite.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import Foundation

class Activite : Identifiable, Hashable {
    
    var id: UUID = UUID()
    var typeActivite: TypeActivite?
    var date: Date
    var duree: Int
    var caloriesBrulees: Double
    
    init(id: UUID, typeActivite: TypeActivite?, date: Date, duree: Int, caloriesBrulees: Double) {
        self.id = id
        self.typeActivite = typeActivite
        self.date = date
        self.duree = duree
        self.caloriesBrulees = caloriesBrulees
    }
    
    // MARK: - Hashable
static func == (lhs: Activite, rhs: Activite) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let activite1 = Activite(id: UUID(), typeActivite: .basket, date: Date(), duree: 60, caloriesBrulees: 240)
