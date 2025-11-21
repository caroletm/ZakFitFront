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
    
    var body: some View {
        
        Group {
            if authVM.isAuthenticated {
                
                NavigationStack(path: $navigationVM.path) {
                    
                    TabBarView()
                    
                        .navigationDestination(for: AppRoute.self) { route in
                            switch route {
                            case .logIn:
                                Login()
                            case .signIn:
                                SignIn()
                            case .profilOnboarding (let user) :
                                ProfilOnboarding(user: user)
                            }
                        }
                }
            }else{
                if authVM.showLogin {
                    Login()
                }else if authVM.showSignIn {
                    SignIn()
                }
            }
        }
        .environment(authVM)
        .environment(navigationVM)
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel())
        .environment(NavigationViewModel())
}
