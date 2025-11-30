//
//  BarreCaloriesConso.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BarreCaloriesConso: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    @Environment(ObjectifViewModel.self) var objectifVM

    
    @State var isFlipped : Bool = false
    
    var body: some View {
        
        let objectif = objectifVM.caloriesCiblesCalculees()
        let calories = repasVM.totalCaloriesJour
        let ratio = objectif > 0 ? min(calories / objectif, 1) : 0
        let barHeight = ratio * 116
        
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
                        .frame(width: 68, height: barHeight)
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
                        if objectif > 0 {
                            Text("\(String(format: "%.0f", calories/objectif * 100)) %")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.bottom)
                        }else {
                            Text("0%")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.bottom)
                        }
                        Text("de\n l'objectif")
                            .font(.system(size: 8, weight: .bold))
                    }.padding(.bottom)
                        .frame(width: 68)
                        .foregroundStyle(Color.greyDark)
                }else{
                    VStack {
                        Text("\(String(format: "%.0f", calories))")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        Text("calories\nconsommées")
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
    let userVM = UserViewModel()
    BarreCaloriesConso()
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
        .environment(ObjectifViewModel(userVM: userVM))
}
