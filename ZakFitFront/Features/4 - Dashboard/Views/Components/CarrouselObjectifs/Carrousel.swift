//
//  CarrouselObjectifs.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct Carrousel: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    @State var selectedIndex: Int = 0
    
    enum ObjectifSlide: Int, CaseIterable, Identifiable {
        case calories
        case macros
        case reco
        case message
        
        var id: Int { self.rawValue }
    }
    
    @ViewBuilder
    func slideView(for slide: ObjectifSlide) -> some View {
        switch slide {
        case .calories:
            CaloriesDuJour(consumed: 1200, goal: 1900)
        case .macros:
            MacrosDuJour()
        case .reco:
            RecoDuJour()
        case .message:
            MessageDuJour()
        }
    }
    
    let slides = ObjectifSlide.allCases

    var body: some View {
        
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(slides) { slide in
                    slideView(for: slide)
                        .frame(width: 345, height: 215)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .tag(slide.rawValue)
                }
            }
            .frame(height: 235)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 8) {
                ForEach(slides) { slide in
                    Circle()
                        .fill(selectedIndex == slide.rawValue ? Color.orangeLight300 : Color.greyLight100)
                        .frame(width: 8, height: 8)
                }
            }/*.padding()*/
        }
    }
}

#Preview {
    Carrousel()
        .environment(NavigationViewModel())
}
