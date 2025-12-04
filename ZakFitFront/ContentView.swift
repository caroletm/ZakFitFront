//
//  ContentView.swift
//  ZakFitFront
//
//  Created by caroletm on 20/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var userVM : UserViewModel
    @State private var authVM : AuthViewModel
    @State private var objectifVM : ObjectifViewModel
    @State private var activiteVM: ActiviteViewModel
    @State private var navigationVM = NavigationViewModel()
    @State private var repasVM = RepasViewModel()
    
    init() {
        let userVM = UserViewModel()
        self._userVM = State(initialValue: userVM)
        self._authVM = State(initialValue: AuthViewModel(userVM: userVM))
        self._objectifVM = State(initialValue: ObjectifViewModel(userVM: userVM))
        self._activiteVM = State(initialValue: ActiviteViewModel(userVM: userVM))
    }
    
    var body: some View {
        
        NavigationStack(path: $navigationVM.path) {
                  
                  Group {
                      if authVM.isAuthenticated {
                          
                          if authVM.isFirstConnexion {
                              ProfilOnboarding()
                          } else {
                              TabBarView()
                          }
                      } else {
                          if authVM.showLogin {
                              Login()
                          } else if authVM.showSignIn {
                              SignIn()
                          }
                      }
                  }
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
                          Suivi()
                      case .historique:
                          Historique()
                      case .notifications:
                          Notifications()
                      case .ajoutRepas:
                          AjoutRepas(showRepasModal: .constant(false), origin: .repasList)
                      case .ajoutActivite:
                          AjoutActivite(showActiviteModal: .constant(false), origin: .activiteList)
                      case .detailRepas(let repas):
                          DetailRepas(repas: repas)
                      case .detailActivite(let activite):
                          DetailActivite(activite: activite)
                      case .repasFiltres:
                          FiltrerRepas()
                      case .activiteFiltres:
                          FiltrerActivite()
                      case .FAQ:
                          FAQ()
                      }
                  }
              }
              .environment(userVM)
              .environment(authVM)
              .environment(navigationVM)
              .environment(objectifVM)
              .environment(repasVM)
              .environment(activiteVM)
          }
      }

#Preview {
    let userVM = UserViewModel()
    ContentView()
        .environment(AuthViewModel(userVM: userVM))
        .environment(NavigationViewModel())
        .environment(userVM)
        .environment(ObjectifViewModel(userVM: userVM))
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
}
