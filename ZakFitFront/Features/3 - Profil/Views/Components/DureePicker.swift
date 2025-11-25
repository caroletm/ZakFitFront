//
//  DureePicker.swift
//  ZakFitFront
//
//  Created by caroletm on 24/11/2025.
//

import SwiftUI

public struct DureePicker: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(UserViewModel.self) var userVM
    @Environment(ObjectifViewModel.self) var objectifVM
    
    @Binding var showPicker: Bool

    public var body: some View {
        
        @Bindable var objectifVM = objectifVM
        
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
            
                Picker("NbDuree", selection: $objectifVM.nbDuree) {
                    ForEach(1...50, id: \.self) { value in
                        Text("\(value)").tag(Optional(value))
                    }
                }
                .pickerStyle(.wheel)
                
                Picker("UnitDuree", selection: $objectifVM.uniteDuree) {
                    ForEach(UniteDuree.allCases, id: \.self) { unite in
                        Text(unite.description).tag(Optional(unite))
                    }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    DureePicker(showPicker: .constant(true))
        .environment(NavigationViewModel())
        .environment(userVM)
        .environment(ObjectifViewModel(userVM: userVM))
}
