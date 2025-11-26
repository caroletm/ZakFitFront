//
//  AjoutRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct AjoutRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var body: some View {
        Text("AjoutRepas")
    }
}

#Preview {
    AjoutRepas()
        .environment(NavigationViewModel())
}
