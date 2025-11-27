//
//  Historique.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct Historique : View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var body: some View {
        Text("Historique")
    }
}

#Preview {
    Historique()
        .environment(NavigationViewModel())
}
