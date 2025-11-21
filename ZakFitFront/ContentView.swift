//
//  ContentView.swift
//  ZakFitFront
//
//  Created by caroletm on 20/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .environment(authViewModel)
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel())
}
