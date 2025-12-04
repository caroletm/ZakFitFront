//
//  RectangleCaloriesEstimees.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI

struct RectangleCaloriesEstimees: View {
    @Environment(RepasViewModel.self) var repasVM
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 158, height: 117)
                .foregroundStyle(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            VStack {
                Text("Calories estimées")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.black)
                Text("\(String(format: "%.0f",repasVM.calculerCaloriesTotalesRepasTemp()))")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color.orangeLight300)
                Text("calories")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.orangeLight300)
            }
        }
    }
}

#Preview {
    RectangleCaloriesEstimees()
        .environment(RepasViewModel())
}
