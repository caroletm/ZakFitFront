//
//  ActiviteViewModel.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI
import Observation
import Foundation

@Observable

class ActiviteViewModel {
    
    var userVM : UserViewModel
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
    
    //MARK: - Activités Data
    
    var activiteData: [Activite] = []
    
    //MARK: - Ajouter Activite
    
    var dateActivite: Date = Date()
    var selectedActivite : TypeActivite? = nil
    var selectedDuree : Int? = nil
    var caloriesBrulees : Double? = nil
    
    //MARK: - Calculer calories brulees
    
//    Le MET (Metabolic Equivalent of Task) ou l'équivalent métabolique est l'unité correspondante. Son échelle s'étend de 1,0 MET (sommeil) à 23,0 MET (course en sprint à plus de 22,5 km/h). La marche à allure modérée (4.5 km/h) équivaut à 3.5 MET, la course à pied (8 km/h), à 8 MET. « Le MET est utilisé par les professionnel·le.s de santé, car il permet d'affiner nettement le total des dépenses caloriques. C’est ce qu’utilisent les montres connectées pour établir le nombre de calories dépensées selon son activité physique, et en fonction de nos données anthropométriques. C’est un bon outil pour obtenir facilement les infos et rester motivé.e en voyant le cumul de ses efforts » suggère la coach sportive.
//
//    Une fois l'unité correspondant au sport pratiqué, on peut connaître la dépense kcal/minute obtenue via la formule suivante :
//    Kcal/minute = (MET X 3,5 X Poids en kg)/200
//    https://conseilsport.decathlon.fr/calculer-ses-depenses-energetiques#b917aae5-678e-400c-931d-234bfac757d1

    
    func caloriesBruleesCalculees() -> Double {
        guard let poids = userVM.poids else { return 0 }
        
        let MET = selectedActivite?.MET ?? 0
        let dureeEnMinutes = selectedDuree ?? 0
        
        let resultat = (MET * 3.5 * poids) / 200 * Double(dureeEnMinutes)
        
        return resultat
    }
    
    //MARK: - Create Activite
    
    func createActivite() {
        let newActivite = Activite(
            id: UUID(),
            typeActivite: selectedActivite ?? .none,
            date: dateActivite,
            duree: selectedDuree ?? 0,
            caloriesBrulees: caloriesBruleesCalculees())
        activiteData.append(newActivite)
    }
    
    func isValidCreateActivite() -> Bool {
        return selectedActivite != nil
        && selectedDuree != nil
        && selectedDuree! > 0
        && dateActivite <= Date()
    }
    
    //MARK: - Date
    
    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
}
