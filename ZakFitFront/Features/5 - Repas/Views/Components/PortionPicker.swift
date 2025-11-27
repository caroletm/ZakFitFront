//
//  DureePicker.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

public struct PortionPicker: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    @Binding var showPortionPicker: Bool
    @Binding var selectedPortion: Portion

    public var body: some View {
                
        VStack {
            HStack  {
                Text("Sélectionne un type de portion")
                    .font(.system(size: 18, weight : .bold))
                Spacer()
                Button {
                  
                    showPortionPicker = false
                }label: {
                    Text ("OK")
                }
            }
            .padding()
                
                Picker("Portion", selection: $selectedPortion) {
                    ForEach(Portion.allCases, id: \.self) { portion in
                        Text(portion.description).tag(Optional(portion))
                    }
                }
                .pickerStyle(.wheel)

        }
    }
}

#Preview {
    PortionPicker(showPortionPicker: .constant(true), selectedPortion: .constant(.unite))
        .environment(NavigationViewModel())
//        .environment(userVM)
//        .environment(ObjectifViewModel(userVM: userVM))
}
