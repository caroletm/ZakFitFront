//
//  AjoutModal.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI

struct AjoutModal: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    @State var selectedTab: String = "Ajouter"
    @State var tabs : [String] = ["Ajouter", "Créer"]
    
    @State var selectedAliment : Aliments = .parDefault
    @State var showAlimentPicker : Bool = false
    @State var selectedPortion: Portion = .unite
    @State var showPortionPicker : Bool = false
    @State var qteAlimentString: String = "0"
    @State var qteAliment : Int = 0
    @State var caloriesParPortionString: String = "0"
    @State var caloriesParPortion : Int = 0
    @State var nomAlimentACreer : String = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.orangeLight50
                    .ignoresSafeArea(edges: .all)
                VStack {
                    Text("Ajoute ton aliment :")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 20)
                    
                    Picker(selection: $selectedTab, label: Text("")) {
                        ForEach(tabs, id: \.self) { tab in
                            Text(tab).tag(tab)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .tint(.orangeLight300) // Change la couleur du segment sélectionné
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 20, trailing: 30))
                    
                    HStack {
                        Text("Nom")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                        Spacer()
                        
                        if selectedTab == "Ajouter" {
                            Button {
                                showAlimentPicker.toggle()
                            }label: {
                                
                                ZStack {
                                    Rectangle()
                                        .frame(width: 100, height: 30)
                                        .foregroundStyle(Color.white)
                                        .cornerRadius(15)
                                    Text("\(selectedAliment.description)")
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundStyle(.black)
                                }
                            }
                        }else if selectedTab == "Créer"{
                            TextField("", text: $nomAlimentACreer)
                                .padding(8)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(.black)
                                .background(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 100, height: 30)
                                .cornerRadius(15)
                                .onChange(of: nomAlimentACreer) {
                                    nomAlimentACreer = nomAlimentACreer
                                }
                        }
                
                    }
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                    
                    HStack {
                        Text("Portion")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                        Spacer()
                        Button {
                            showPortionPicker.toggle()
                        }label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundStyle(Color.white)
                                    .cornerRadius(15)
                                Text("\(selectedPortion.description)")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 10, trailing: 40))
                    
                    HStack {
                        Text("Quantité")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                        Spacer()
                        TextField("", text: $qteAlimentString)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.black)
                            .background(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 100, height: 30)
                            .cornerRadius(15)
                            .onChange(of: qteAlimentString) {
                                qteAlimentString = qteAlimentString.filter { $0.isNumber }
                                qteAliment = Int(qteAlimentString) ?? 0
                            }
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 10, trailing: 40))
                    
                    HStack {
                        Text("Calories par portion")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                        Spacer()
                        TextField("", text: $caloriesParPortionString)
                            .keyboardType(.numberPad)
                            .padding(8)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(.black)
                            .background(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 100, height: 30)
                            .cornerRadius(15)
                            .onChange(of: caloriesParPortionString) {
                                caloriesParPortionString = caloriesParPortionString.filter { $0.isNumber }
                                caloriesParPortion = Int(caloriesParPortionString) ?? 0
                            }
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 10, trailing: 40))
                    
                    HStack {
                        Text("Calories estimées")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.orangeLight300)
                        Spacer()
                        VStack() {
                            Text("40")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                            Text("calories")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.orangeLight300)
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                    
                    HStack{
                        VStack (alignment :.leading, spacing: 10) {
                            Text("Macronutriments estimés :")
                                .underline()
                            Text("Protéines : 10g")
                            Text("Glucides : 20g")
                            Text("Lipides : 10g")
                        }
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.orangeLight300)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                    
                    if selectedTab == "Ajouter" {
                        
                        BoutonOrange(text: "Valider", width: 105, height: 40) {
                            //
                        }.padding(5)
                        
                    }else if selectedTab == "Créer"{
                        
                        BoutonOrange(text: "Créer l'aliment", width: 155, height: 40) {
                            //
                        }
                        .padding(5)
                    }
                    BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {
                        
                    }
                }
            }
            .sheet(isPresented: $showAlimentPicker) {
                AlimentPicker(showAlimentPicker: $showAlimentPicker, selectedAliment: $selectedAliment)
                    .presentationDetents([.fraction(0.3)])
            }
            .sheet(isPresented: $showPortionPicker) {
                PortionPicker(showPortionPicker: $showPortionPicker, selectedPortion: $selectedPortion)
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
}

#Preview {
    AjoutModal()
        .environment(NavigationViewModel())
}
