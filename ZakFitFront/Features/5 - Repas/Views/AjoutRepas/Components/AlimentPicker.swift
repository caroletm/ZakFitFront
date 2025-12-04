//
//  DureePicker.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

public struct AlimentPicker: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM
    
    @Binding var showAlimentPicker: Bool
    @Binding var selectedAliment: AlimentDTO?

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
                    ForEach(repasVM.alimentData, id: \.self) { aliment in
                        Text(aliment.nom).tag(Optional(aliment))
                    }
                }
                .pickerStyle(.wheel)

        }
        .onAppear {
            Task {
                await repasVM.fetchAliments()
            }
        }
    }
}

#Preview {
    AlimentPicker(showAlimentPicker: .constant(true), selectedAliment: .constant(AlimentDTO(nom: "pomme", portion: .unite, calories: 50, proteines: 0.1, glucides: 10, lipides: 5)))
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}
