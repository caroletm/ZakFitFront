//
//  BarreMinsActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct BarreMinsActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ObjectifViewModel.self) var objectifVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    @State var isFlipped : Bool = false
    
    var body: some View {
        
        let objectif = objectifVM.dureeActivite
        let minsActivite = activiteVM.totalMinsActivitesJour
        let ratio = objectif ?? 30 > 0 ? min(minsActivite / (objectif ?? 30), 1) : 0
        let barHeight = ratio * 116
        
        Button {
            isFlipped.toggle()
            print("minsActivite: \(minsActivite)")
            print("objectif: \(objectif ?? 30)")
       
        }label:{
            
            ZStack (alignment : .bottom) {
                
                ZStack (alignment : .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 68, height: 116)
                        .foregroundStyle(Color.greyDark)
                        .opacity(isFlipped ? 0.4 : 0.2)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 68, height: CGFloat(barHeight))
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
                        Text("\(minsActivite / (objectif ?? 30) * 100) %")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom)
                        Text("de\n l'objectif")
                            .font(.system(size: 8, weight: .bold))
                    }.padding(.bottom)
                        .frame(width: 68)
                        .foregroundStyle(Color.orangeLight50)
                }else{
                    VStack {
                        Text("\(minsActivite)")
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
    let userVM = UserViewModel()
    BarreMinsActivite()
        .environment(NavigationViewModel())
        .environment(ObjectifViewModel(userVM:userVM))
        .environment(ActiviteViewModel(userVM:userVM))
}
