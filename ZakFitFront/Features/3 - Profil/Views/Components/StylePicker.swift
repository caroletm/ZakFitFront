//
//  StylePicker.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct StyledPicker<T: Hashable & CaseIterable>: View {
    
//    @Environment(NavigationViewModel.self) var navigationVM
//    @Environment(UserViewModel.self) var userVM
//    @Environment(ObjectifViewModel.self) var objectifVM
    
    @Binding var selection: T
    let labelFor: (T) -> String
    @State private var showing = false

    var body: some View {
        
        Button(action: { showing = true }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.greyLight50)
                HStack {
                    Text(labelFor(selection))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.greyDark)
                }
                .padding(.horizontal)
            }
            .frame(height: 44)
        }
        .sheet(isPresented: $showing) {
            VStack {
                HStack {
                    Spacer()
                    Button("OK") { showing = false }
                        .padding()
                }
                Picker("", selection: $selection) {
                    ForEach(Array(T.allCases), id: \.self) { value in
                        Text(labelFor(value)).tag(value)
                    }
                }
                .labelsHidden()
                .pickerStyle(WheelPickerStyle())
            }
            .presentationDetents([.height(230)])
        }
    }
}
