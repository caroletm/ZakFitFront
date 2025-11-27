//
//  DetailActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct DetailActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var body: some View {
        Text("DetailActivite")
    }
}

#Preview {
    DetailActivite()
        .environment(NavigationViewModel())
}
