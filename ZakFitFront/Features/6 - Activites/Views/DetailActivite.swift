//
//  DetailActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct DetailActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var activite: ActiviteDTO
    
    var body: some View {
        Text("DetailActivite")
    }
}

#Preview {
    DetailActivite(activite: activite1)
        .environment(NavigationViewModel())
}
