//
//  RepasViewModel.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import Foundation
import SwiftUI

@Observable

class RepasViewModel {
    
    //MARK: - Repas Aliments Data
    
    var repasData : [Repas] = [repas1]
    var alimentData : [Aliment] = []
    var consoData : [Conso] = [conso1]
    
    //MARK: - Ajouter Repas
    
    var dateRepas: Date = Date()
    var selectedRepas: TypeRepas? = nil
    
    //MARK: - Ajouter Aliment
    
    var nomAlimentACreer : String = ""
    var selectedAliment : Aliments? = nil
    var selectedPortion: Portion? = nil
    var qteAliment : Int? = nil
    var caloriesParPortion : Double? = nil
    
    //MARK: - Calcul calories et macronutriments par Aliment et par Repas
    
    func calculerCaloriesTotalesSiRenseignées() -> Double? {
        return ((caloriesParPortion ?? 0) * Double(qteAliment ?? 0))
    }
    
    func calculerCaloriesParPortion() -> Double {
        
        let aliment: Aliments = selectedAliment ?? .parDefault
        let portion: Portion = selectedPortion ?? .unite
        
        let base = Double(aliment.nutriments.calories)

          switch portion {
          case .unite, .verre, .tasse, .tranche, .cuillere:
              // calories définies pour 1 portion
              return base

          case .gramme, .mililitre:
              // calories définies pour 100g // 1mL = 1g
              return base / 100

          case .kilo, .litre:
              // 1 kg = 1000g // 1L = 1000ml
              return (base * 1000) / 100
     
          case .parDefault:
              return 0
          }
    }
    
    func calculerCaloriesTotales() -> Double {
        return calculerCaloriesParPortion() * Double(qteAliment ?? 0)
    }
    
    func calculerCaloriesTotalesRepas() -> Double {
        var totalCalories: Double = 0
        for conso in consoData {
            totalCalories += conso.calories
        }
        return totalCalories
    }
    
    func calculerProteinesTotales() -> Double {
        let aliment: Aliments = selectedAliment ?? .parDefault
        let portion: Portion = selectedPortion ?? .unite
        let quantite : Int = qteAliment ?? 0
        
        let base = aliment.nutriments.proteines
        
        switch portion {
        case .unite, .verre, .tasse, .tranche, .cuillere:
            return base * Double(quantite)
            
        case .gramme, .mililitre:
            return (base / 100) * Double(quantite)
            
        case .kilo, .litre:
            return (base * 1000) / 100 * Double(quantite)
 
        case .parDefault:
           return 0
        }
    }
    
    func calculerGlucidesTotales() -> Double {
        let aliment: Aliments = selectedAliment ?? .parDefault
        let portion: Portion = selectedPortion ?? .unite
        let quantite : Int = qteAliment ?? 0
        
        let base = aliment.nutriments.glucides
        
        switch portion {
        case .unite, .verre, .tasse, .tranche, .cuillere:
            return base * Double(quantite)
            
        case .gramme, .mililitre:
            return (base / 100) * Double(quantite)
            
        case .kilo, .litre:
            return (base * 1000) / 100 * Double(quantite)

        case .parDefault:
            return 0
        }
    }
    
    func calculerLipidesTotales() -> Double {
        let aliment: Aliments = selectedAliment ?? .parDefault
        let portion: Portion = selectedPortion ?? .unite
        let quantite : Int = qteAliment ?? 0
        
        let base = aliment.nutriments.lipides
        
        switch portion {
        case .unite, .verre, .tasse, .tranche, .cuillere:
            return base * Double(quantite)
            
        case .gramme, .mililitre:
            return (base / 100) * Double(quantite)
            
        case .kilo, .litre:
            return (base * 1000) / 100 * Double(quantite)

        case .parDefault:
            return 0
        }
    }
    
    func calculerProteinesTotalesRepas() -> Double {
        var totalProteines: Double = 0
        for conso in consoData {
            totalProteines += conso.proteines
        }
        return totalProteines
    }
    
    func calculerGlucidesTotalesRepas() -> Double {
        var totalGlucides: Double = 0
        for conso in consoData {
            totalGlucides += conso.glucides
        }
        return totalGlucides
    }
    
    func calculerLipidesTotalesRepas() -> Double {
        var totalLipides: Double = 0
        for conso in consoData {
            totalLipides += conso.lipides
        }
        return totalLipides
    }
    
    func calculerMacrosTotales(for consos: [Conso]) -> (calories: Double, proteines: Double, glucides: Double, lipides: Double) {
        var totalCalories = 0.0
        var totalProteines = 0.0
        var totalGlucides = 0.0
        var totalLipides = 0.0
        
        for conso in consos {
            totalCalories += conso.calories
            totalProteines += conso.proteines
            totalGlucides += conso.glucides
            totalLipides += conso.lipides
        }
        
        return (totalCalories, totalProteines, totalGlucides, totalLipides)
    }
    
    //MARK: - Ajouter aliment consommé
    
    func AddAlimentConsommé() {
        let newConso = Conso(
            aliment: selectedAliment?.description ?? "-",
            portion : selectedPortion ?? .parDefault,
            quantite: qteAliment ?? 0,
            calories: calculerCaloriesTotales(),
            proteines: calculerProteinesTotales(),
            glucides: calculerGlucidesTotales(),
            lipides: calculerLipidesTotales()
        )
        consoData.append(newConso)
    }
    func createAlimentConsommé() {
        let newConso = Conso(
            aliment: nomAlimentACreer,
            portion : selectedPortion ?? .parDefault,
            quantite: qteAliment ?? 0,
            calories: calculerCaloriesTotales(),
            proteines: calculerProteinesTotales(),
            glucides: calculerGlucidesTotales(),
            lipides: calculerLipidesTotales()
        )
        consoData.append(newConso)
    }
    
    func isValidAddConso() -> Bool {
        return selectedAliment != nil
            && qteAliment != nil && qteAliment! > 0
            && selectedPortion != nil
            && calculerCaloriesTotales() > 0
    }
    
    func isValidCreateConso() -> Bool {
        return !nomAlimentACreer.isEmpty
            && qteAliment != nil && qteAliment! > 0
            && selectedPortion != nil
            && calculerCaloriesTotales() > 0
    }
    
 
    
    //MARK: - Vider la liste des aliments consommés
    
    func clearList() {
        consoData.removeAll()
    }
    
    //MARK: - Créer un repas
    
    func createRepas() {
        let newRepas = Repas(
            id : UUID(),
            typeRepas: selectedRepas ?? .encas,
            date: dateRepas,
            calories: calculerCaloriesTotales(),
            consos: consoData
        )
        repasData.append(newRepas)
    }
    
    func isValidCreateRepas() -> Bool {
        return selectedRepas != nil
            && !consoData.isEmpty
            && calculerCaloriesTotalesRepas() > 0
            && dateRepas <= Date()
    }
    
    //MARK: - Date
    
    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
}
