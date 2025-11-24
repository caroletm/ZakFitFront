//
//  Dashboard.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Dashboard : View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        VStack {
            Button {
                navigationVM.path.append(AppRoute.profil)
                
            }label: {
                Image(.profilOrange)
            }
            Text("Dashboard")
        }
    }
}

#Preview {
    Dashboard()
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}
