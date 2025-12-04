//
//  NotifiLine.swift
//  ZakFitFront
//
//  Created by caroletm on 04/12/2025.
//

import SwiftUI

struct NotifiLine: View {
    
    @Environment(RepasViewModel.self) var repasVM
    var notification : Notification

    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                ZStack {
                    Circle()
                        .fill(.orangeLight100)
                        .frame(width: 42, height: 42)
                    Image(systemName: notification.image)
                        .font(.system(size: 18, weight :.bold))
                }
                VStack (alignment : .leading) {
                    Text(notification.description)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.bottom, 2)
                    Text("\(repasVM.dateFormatterAgo(notification.date))")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.greyDark)
                }.padding(.horizontal, 10)
                    .padding(.leading, 10)
            }
            .padding()
            Divider()
                .background(Color.accent)
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    NotifiLine(notification: Notification(type: .repas, categorie: .alerte, date: Date(), isRead: false))
        .environment(RepasViewModel())
}
