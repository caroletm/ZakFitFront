//
//  ResumeDouble.swift
//  ZakFitFront
//
//  Created by caroletm on 29/11/2025.
//

import SwiftUI

struct ResumeRectangle : View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ActiviteViewModel.self) var activiteVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    var calories : String
    var colorBackground : LinearGradient
    var texte : String
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(colorBackground)
                .frame(width: 79, height: 101)
            VStack{
                Text(calories)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.bottom, 4)
                Text(texte)
                    .font(.system(size: 11, weight: .bold))
                    .multilineTextAlignment(.center)
            }.foregroundStyle(Color.white)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ResumeRectangle(calories: "8000", colorBackground: LinearGradient(
        colors: [.greyLight100, .greyLight200],
        startPoint: .top,
        endPoint: .bottom
    ), texte: "calories\nbrulées")
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
        .environment(ObjectifViewModel(userVM: userVM))
}
