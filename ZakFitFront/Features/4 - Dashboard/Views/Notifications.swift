//
//  Notifications.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct Notifications: View {
    @Environment(NavigationViewModel.self) var navigationVM
    var body: some View {
        Text("Notifications")
    }
}

#Preview {
    Notifications()
        .environment(NavigationViewModel())
}
