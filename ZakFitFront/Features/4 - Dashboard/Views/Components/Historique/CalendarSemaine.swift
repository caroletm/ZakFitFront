//
//  CalendarSemaine.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//

import Foundation

extension Calendar {
    
    func startOfWeek(for date: Date) -> Date {
        let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return self.date(from: components)!
    }
    
    func endOfWeek(for date: Date) -> Date {
        let start = startOfWeek(for: date)
        return self.date(byAdding: .day, value: 6, to: start)!
    }
    
    func weekLabel(start: Date, end: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd "
        
        let startStr = formatter.string(from: start)
        formatter.dateFormat = "dd MMMM yyyy"
        let endStr = formatter.string(from: end)
        
        return "Du \(startStr) au \(endStr)"
    }
}

