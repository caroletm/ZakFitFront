//
//  BarreCaloriesConso.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BarreCaloriesConso: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var maxCalories : Double = 100
    var currentCalories : Double =  40
    @State var isFlipped : Bool = false
    
    var body: some View {
        Button {
            isFlipped.toggle()
        }label:{
            ZStack (alignment : .bottom) {
                
                ZStack(alignment : .bottom)  {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 68, height: 116)
                        .foregroundStyle(Color.orangeLight300)
                        .opacity(isFlipped ? 0.4 : 0.2)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 68, height: currentCalories > maxCalories ? maxCalories : (currentCalories/maxCalories) * 116)
                        .foregroundStyle(Color.orangeLight300)
                        .opacity(isFlipped ? 0.5 : 0.3)
                }
                .rotation3DEffect(
                    .degrees(isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut(duration: 0.4), value: isFlipped)
                
                if isFlipped {
                    VStack {
                        Text("\(String(format: "%.0f", currentCalories)) %")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        Text("de\n l'objectif")
                            .font(.system(size: 8, weight: .bold))
                    }.padding(.bottom)
                        .frame(width: 68)
                        .foregroundStyle(Color.greyDark)
                }else{
                    VStack {
                        Text("300")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        Text("calories\nbrûlées")
                            .font(.system(size: 8, weight: .bold))
                    }.padding(.bottom)
                        .frame(width: 68)
                        .foregroundStyle(Color.orangeLight300)
                }
            }
        }
    }
}

#Preview {
    BarreCaloriesConso()
        .environment(NavigationViewModel())
}
