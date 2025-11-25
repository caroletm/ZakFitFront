//
//  Objectif.swift
//  ZakFitFront
//
//  Created by caroletm on 25/11/2025.
//

import SwiftUI
import Foundation

class Objectif : Identifiable, Hashable {
    var id: UUID = UUID()
    var objectifGlobal: UserObjectifGlobal
    var dateDebut: Date
    var dateFin: Date?
    var typeObjectif : TypeObjectif
    var poidsCible: Double?
    var caloriesParJour: Int?
    var proteines : Double?
    var glucides : Double?
    var lipides : Double?
    var minsActivité: Int?
    var caloriesBruleesParJour: Int?
    var nbEntrainementsHebdo: Int?
    
    init (id: UUID, objectifGlobal: UserObjectifGlobal, dateDebut: Date, dateFin: Date?, typeObjectif: TypeObjectif, poidsCible: Double?, caloriesParJour: Int?, proteines: Double?, glucides: Double?, lipides: Double?, minsActivité: Int?, caloriesBruleesParJour: Int?, nbEntrainementsHebdo: Int?) {
        self.id = id
        self.objectifGlobal = objectifGlobal
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.typeObjectif = typeObjectif
        self.poidsCible = poidsCible
        self.caloriesParJour = caloriesParJour
        self.proteines = proteines
        self.glucides = glucides
        self.lipides = lipides
        self.minsActivité = minsActivité
        self.caloriesBruleesParJour = caloriesBruleesParJour
        self.nbEntrainementsHebdo = nbEntrainementsHebdo
    }
    
    // MARK: - Hashable
static func == (lhs: Objectif, rhs: Objectif) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
