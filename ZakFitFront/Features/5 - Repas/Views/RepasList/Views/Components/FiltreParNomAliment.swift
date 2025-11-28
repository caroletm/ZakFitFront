//
//  FiltreParNomAliment.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//
import SwiftUI

struct FiltreParNomAliment: View {
    @Environment(RepasViewModel.self) var repasVM
    
    @State var nomAlimentFiltre: String = ""
    @State var alimentsFiltres: [String] = []
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text("Par aliment ou macronutriments : ")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            TextField("Nom aliment", text: $nomAlimentFiltre)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.greyLight50)
                .cornerRadius(10)
                .font(.system(size: 14, weight: .bold))
                .frame(width: 360)
                .onSubmit {
                    let trimmed = nomAlimentFiltre.trimmingCharacters(in: .whitespaces)
                    guard !trimmed.isEmpty else { return }
                    
                    if !alimentsFiltres.contains(trimmed) {
                        alimentsFiltres.append(trimmed)
                    }
                    nomAlimentFiltre = ""
                    repasVM.filterAliment = alimentsFiltres.joined(separator: ",")
                }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    ForEach(alimentsFiltres, id: \.self) { aliment in
                        HStack(spacing: 6) {
                            Text(aliment)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                            
                            Button {
                                // Supprimer le tag
                                alimentsFiltres.removeAll { $0 == aliment }
                                
                                // Mise à jour du filtre dans le ViewModel
                                repasVM.filterAliment = alimentsFiltres.joined(separator: ",")
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Color.orangeLight300)
                        .cornerRadius(10)
                    }
                }
                .padding(.top, 5)
            }
            .frame(height: 40)
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
    }
}
