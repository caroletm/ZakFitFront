//
//  BarreMinsActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BarreMinsActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    var maxActivity : Double = 100
    var currentActivity : Double =  80
    @State var isFlipped : Bool = false
    
    var body: some View {
        Button {
            isFlipped.toggle()
        }label:{
            
            ZStack (alignment : .bottom) {
                
                ZStack (alignment : .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 68, height: 116)
                        .foregroundStyle(Color.greyDark)
                        .opacity(isFlipped ? 0.4 : 0.2)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 68, height: currentActivity > maxActivity ? maxActivity : (currentActivity/maxActivity) * 116)
                        .foregroundStyle(Color.greyDark)
                        .opacity(isFlipped ? 0.5 : 0.3)
                }
                .rotation3DEffect(
                    .degrees(isFlipped ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut(duration: 0.4), value: isFlipped)
                
                if isFlipped {
                    VStack {
                        Text("\(String(format: "%.0f", currentActivity)) %")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        Text("de\n l'objectif")
                            .font(.system(size: 8, weight: .bold))
                    }.padding(.bottom)
                        .frame(width: 68)
                        .foregroundStyle(Color.orangeLight50)
                }else{
                    VStack {
                        Text("60")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        Text("mins\nd'activité")
                            .font(.system(size: 8, weight: .bold))
                    }.padding(.bottom)
                        .frame(width: 68)
                        .foregroundStyle(Color.greyDark)
                }
            }
        }
    }
}

#Preview {
    BarreMinsActivite()
        .environment(NavigationViewModel())
}
