//
//  PickerSemaineSelectionne.swift
//  ZakFitFront
//
//  Created by caroletm on 30/11/2025.
//

import SwiftUI

struct PickerSemaineSelectionne: View {
    @Environment(ActiviteViewModel.self) var activiteVM
        
    var body: some View {
        HStack {
            Button {
                activiteVM.previousWeek()
            }label:{
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.orangeLight300)
                    .padding(.horizontal)
            }
            
            Text(Calendar.current.weekLabel(
                start: activiteVM.startOfWeek,
                end: activiteVM.endOfWeek
            ))
                .font(.system(size: 20, weight: .bold))
            
            Button {
                activiteVM.nextWeek()

            }label:{
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.orangeLight300)
                    .padding(.horizontal)
            }
        }.padding(.vertical)
    }
}

#Preview {
    let userVM = UserViewModel()
    PickerSemaineSelectionne()
        .environment(ActiviteViewModel(userVM : userVM))
    
}
