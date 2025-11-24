//
//  DureePicker.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

public struct DureePicker: View {
    
    @Binding var nbDuree: Int?
    @Binding var uniteDuree: String?
    var uniteDureePossible : [String] = ["semaine", "mois", "année"]
    @Binding var showPicker: Bool
    
    public var body: some View {
        
        VStack {
            HStack  {
                Text("Objectif de durée")
                    .font(.system(size: 18, weight : .bold))
                Spacer()
                Button {
                    showPicker = false
                }label: {
                    Text ("OK")
                }
            }
            .padding()
            HStack {
            
                Picker("NbDuree", selection: $nbDuree) {
                    ForEach(1...50, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(.wheel)
                
                Picker("UnitDuree", selection: $uniteDuree) {
                    ForEach(uniteDureePossible, id: \.self) { unite in
                        Text(unite)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}

#Preview {
    DureePicker(nbDuree: .constant(3), uniteDuree: .constant("semaines"), showPicker: .constant(true))
}
