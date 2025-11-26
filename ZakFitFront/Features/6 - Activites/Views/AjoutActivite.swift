//
//  AjoutActivites.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct AjoutActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var body: some View {
        Text("AjoutActivite")
    }
}

#Preview {
    AjoutActivite()
        .environment(NavigationViewModel())
}
