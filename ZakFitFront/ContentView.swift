//
//  ContentView.swift
//  ZakFitFront
//
//  Created by caroletm on 20/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var authVM = AuthViewModel()
    @State private var navigationVM = NavigationViewModel()
    @State private var userVM = UserViewModel()
    
    var body: some View {
        
        
        NavigationStack(path: $navigationVM.path) {
            
            if authVM.isAuthenticated {
                
                TabBarView()
                
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .logIn:
                            Login()
                        case .signIn:
                            SignIn()
                        case .profilOnboarding:
                            ProfilOnboarding()
                        case .profil:
                            Profil()
                        case .parametres:
                            Parametres()
                        case .objectifs:
                            Objectifs()
                        case .objectifsAvances:
                            ObjectifsAvances()
                        case .dashboard:
                            Dashboard()
                        case .repasList:
                            RepasList()
                        case .activitesList:
                            ActivitesList()
                        case .stats:
                            Stats()
                        }
                    }
            } else {
                if authVM.showLogin {
                    Login()
                }else if authVM.showSignIn {
                    SignIn()
                }
            }
        }
            .environment(authVM)
            .environment(navigationVM)
            .environment(userVM)
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel())
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}
