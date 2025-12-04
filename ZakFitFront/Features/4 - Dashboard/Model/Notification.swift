//
//  Notification.swift
//  ZakFitFront
//
//  Created by caroletm on 04/12/2025.
//
import SwiftUI
import Foundation

struct Notification: Identifiable {
    var id: UUID = UUID()
    var type: NotifType
    var categorie: NotifCategorie
    var date: Date
    var isRead: Bool
    var image: String {
        categorie.image
    }
    var description: String {
        switch type {
        case .repas:
            return categorie.textNotifRepas
        case .activite:
            return categorie.textNotifActivite
        }
    }
}

let notifications: [Notification] = [
    Notification(type: .repas, categorie: .alerte, date: Date(), isRead: false),
    Notification(type: .repas, categorie: .motivation, date: Date(), isRead: false),
    Notification(type: .activite, categorie: .motivation, date: Date(), isRead: false),
    Notification(type: .activite, categorie: .rappel, date: Date(), isRead: false),
    Notification(type: .repas, categorie: .suggestion, date: Date(), isRead: false),
    Notification(type: .activite, categorie: .suggestion, date: Date(), isRead: false)
]
