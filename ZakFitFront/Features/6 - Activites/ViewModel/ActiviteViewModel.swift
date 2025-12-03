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
    
    var activiteData: [ActiviteDTO] = []
    
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
    
    var totalCaloriesBruleesJour: Double {
        activitesDuJour.reduce(0) { total, activite in
            total + activite.caloriesBrulees
        }
    }
    
    var totalCaloriesBruleesJourSelectionne: Double {
        activitesDuJourSelectionne.reduce(0) { total, activite in
            total + activite.caloriesBrulees
        }
    }
    
    var totalCaloriesBruleesSemaineSelectionne: Double {
        activitesSemaineSelectionne.reduce(0) { total, activite in
            total + activite.caloriesBrulees
        }
    }
    
    //MARK: - Calculer minutes d'activites par jour (barres dashboard)
    
    var activitesDuJour: [ActiviteDTO] {
        activiteData.filter { activite in
            Calendar.current.isDate(activite.date, inSameDayAs: Date())
        }
    }
    
    var totalMinsActivitesJour: Int {
        activitesDuJour.reduce(0) { total, activite in
            total + activite.duree
        }
    }
    
    //MARK: - Calculer minutes d'activites par jour sélectionné (Historique)
    
    var selectedDate : Date = Date()
    
    var activitesDuJourSelectionne: [ActiviteDTO] {
        activiteData.filter { activite in
            Calendar.current.isDate(activite.date, inSameDayAs: selectedDate)
        }
    }
    
    var totalMinsActivitesJourSelectionne: Int {
        activitesDuJourSelectionne.reduce(0) { total, activite in
            total + activite.duree
        }
    }
    
    //MARK: - Calculer minutes d'activites par semaine sélectionnée (Historique)
    
    var selectedWeek: Date = Calendar.current.startOfWeek(for: Date())
    
    var startOfWeek: Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: selectedDate))!
    }

    var endOfWeek: Date {
        Calendar.current.date(byAdding: .day, value: 6, to: startOfWeek)!
    }
    
    func nextWeek() {
        selectedDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: selectedDate)!
    }

    func previousWeek() {
        selectedDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: selectedDate)!
    }

    var activitesSemaineSelectionne: [ActiviteDTO] {
        activiteData.filter { activite in
            Calendar.current.isDate(activite.date, equalTo: selectedDate, toGranularity: .weekOfYear)
        }
    }
    
    var totalMinsActivitesSemaineSelectionne: Int {
        activitesSemaineSelectionne.reduce(0) { $0 + $1.duree }
        }
    
    //MARK: - Calculer nb d'entrainements
    
    var nbEntrainementsJour: Int {
        activitesDuJour.count
    }
    
    var nbEntrainementsSemaine: Int {
        activitesSemaineSelectionne.count
    }
    
    //MARK: - Create Activite
    
    func createActivite() async {
        let newActivite = ActiviteDTO(
            id: UUID(),
            typeActivite: selectedActivite ?? .courseAPied,
            date: dateActivite,
            duree: selectedDuree ?? 0,
            caloriesBrulees: caloriesBruleesCalculees())
        activiteData.append(newActivite)
        
        do {
            print("BEFORE await:", selectedActivite as Any, selectedDuree as Any)
            _ = try await service.createActivite(newActivite)
            print("BEFORE await:", selectedActivite as Any, selectedDuree as Any)
        }catch {
            print("erreur lors de la création de l'activite, error : \(error)")
        }
    }
    
    func isValidCreateActivite() -> Bool {
        return selectedActivite != nil
        && selectedDuree != nil
        && selectedDuree! > 0
        && dateActivite <= Date()
    }
    
    func resetActivitePicker() {
        selectedActivite = nil
        selectedDuree = nil
        dateActivite = Date()
        caloriesBrulees = nil
    }
    
    //MARK: - Filtrer les activites
    
    var minCaloriesBrulees: Double = 0
    var minDuree : Int = 0
    
    // Résultat filtré
    var activiteFiltres: [ActiviteDTO] {
        
        let filtres = activiteData.filter { activite in

            // Filtre sur type de repas
            if let type = selectedActivite, activite.typeActivite != type {
                return false
            }
            
            if activite.duree < minDuree {
                return false
            }
            
            // Filtre sur calories max
            if activite.caloriesBrulees < minCaloriesBrulees {
                return false
            }
            return true
        }
        switch sortOrder {
        case .recentFirst:
            return filtres.sorted { $0.date > $1.date }
        case .oldestFirst:
            return filtres.sorted { $0.date < $1.date }
        }
    }
    
    var isFilterActive : Bool {
        selectedActivite != nil || minCaloriesBrulees != 0 || minDuree != 0
    }
    
    func resetFilter() {
        selectedActivite = nil
        minCaloriesBrulees = 0
        minDuree = 0
    }
    
    //MARK: - Trier les activites

    enum ActiviteSortOrder {
        case recentFirst
        case oldestFirst
    }
    
    var sortOrder : ActiviteSortOrder = .recentFirst
    
    var activitesTriees: [ActiviteDTO] {
        switch sortOrder {
        case .recentFirst:
            return activiteData.sorted { $0.date > $1.date }
        case .oldestFirst:
            return activiteData.sorted { $0.date < $1.date }
        }
    }
    
    //MARK: - Date
    
    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
    func dateFormatterAgo(_ date: Date) -> String {
        let now = Date()
        let timeAgo = Int(now.timeIntervalSince(date))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        
        if timeAgo < minute {
            return "il y a \(timeAgo) seconde\(timeAgo > 1 ? "s" : "")"
        } else if timeAgo < hour {
            return "il y a \(timeAgo / minute) minute\(timeAgo > 1 ? "s" : "")"
        } else if timeAgo < day {
            return "il y a \(timeAgo / hour) heure\(timeAgo > 1 ? "s" : "")"
        } else {
            let daysAgo = timeAgo / day
            return "il y a \(daysAgo) jour\(daysAgo > 1 ? "s" : "")"
        }
    }
    
    
    // MARK: - Call API : Données Back / Front
    
    private let service = ActiviteService()
    
    //Recupérer les activites
    func fetchActivites() async {
        do {
            activiteData = try await service.getAllActivites()
            print("Activites récupérées : \(activiteData)")
        } catch {
            print("Erreur dans le chargement des activites: \(error)")
        }
    }
    
    
}
