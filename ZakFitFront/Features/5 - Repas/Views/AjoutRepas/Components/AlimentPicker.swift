//
//  DureePicker.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

public struct AlimentPicker: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    @Binding var showAlimentPicker: Bool
    @Binding var selectedAliment: Aliments?

    public var body: some View {
                
        VStack {
            HStack  {
                Text("Sélectionne un aliment")
                    .font(.system(size: 18, weight : .bold))
                Spacer()
                Button {
                  
                    showAlimentPicker = false
                }label: {
                    Text ("OK")
                }
            }
            .padding()
                
                Picker("Aliment", selection: $selectedAliment) {
                    ForEach(Aliments.allCases, id: \.self) { aliment in
                        Text(aliment.description).tag(Optional(aliment))
                    }
                }
                .pickerStyle(.wheel)

        }
    }
}

#Preview {
    AlimentPicker(showAlimentPicker: .constant(true), selectedAliment: .constant(.pomme))
        .environment(NavigationViewModel())
//        .environment(userVM)
//        .environment(ObjectifViewModel(userVM: userVM))
}
