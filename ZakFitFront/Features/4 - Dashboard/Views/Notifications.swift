//
//  Notifications.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct Notifications: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    @State var showPremiumPage: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                VStack {
                    ForEach(notifications) { notification in
                        NotifiLine(notification: notification)
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Mes notifications")
                                .font(.system(size: 24, weight: .bold))
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .padding(.top, 10)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showPremiumPage = true
            }
        }
        .fullScreenCover(isPresented: $showPremiumPage){
            PremiumPage(showPremiumPage: $showPremiumPage)
        }
    }
}

#Preview {
    Notifications()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
