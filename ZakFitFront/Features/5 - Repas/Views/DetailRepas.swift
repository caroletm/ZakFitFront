//
//  DetailRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct DetailRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    var body: some View {
        Text("DetailRepas")
    }
}

#Preview {
    DetailRepas()
        .environment(NavigationViewModel())
}
