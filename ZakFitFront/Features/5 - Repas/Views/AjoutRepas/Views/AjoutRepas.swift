//
//  AjoutRepas.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct AjoutRepas: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(RepasViewModel.self) var repasVM

    @State var showScanModal : Bool = false
    @State var showAjouterModal : Bool = false
    @Binding var showRepasModal : Bool
    @State var showAlertNoValid : Bool = false
    @State var showPremiumPage : Bool = false
    
    enum AjoutRepasOrigin {
        case dashboard
        case repasList
    }
    
    let origin: AjoutRepasOrigin
    
    var body: some View {
        
        @Bindable var repasVM = repasVM
        
        NavigationView {
            
            VStack {
                
                HStack {
                    Text("Date :")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    DatePicker(
                        "",
                        selection: $repasVM.dateRepas,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    
                }
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))

                
                VStack (alignment :.leading) {
                    HStack {
                        Text("Selectionne le type :")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    HStack {
                        ForEach(TypeRepas.allCases, id: \.self) { type in
                            Button {
                                
                                if repasVM.selectedRepas == type {
                                    repasVM.selectedRepas = nil
                                }else{
                                    repasVM.selectedRepas = type
                                }
                                
                            }label: {
                                Text(type.label)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundStyle(repasVM.selectedRepas == type ? Color.white : Color.orangeLight300)
                                    .padding(8)
                                    .background(repasVM.selectedRepas == type ? Color.orangeLight300 : Color.orangeLight100)
                                
                                    .cornerRadius(10)
                                    .padding(5)
                            }
                        }
                    }
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                
                VStack (alignment :.leading){
                    Text("Ajoute un aliment")
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack (spacing: 20) {
                        BoutonScanAjout(image: "barcode.viewfinder", text: "Numérise le code barre", colorText: Color.greyDark, colorButton: Color.greyLight200) {
                            showScanModal = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                showScanModal = false
                                showPremiumPage = true
                            }
                        }
                        BoutonScanAjout(image: "plus.square", text: "Ajoute un aliment", colorText: Color.orangeLight300, colorButton: Color.orangeLight100) {
                            showAjouterModal.toggle()
                        }
                        
                    }
                } .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                
                ListeDesAliments()
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                
                HStack (spacing: 20) {
                    RectangleCaloriesEstimees()
                    RectangleMacronutriments()
                }.padding(.bottom,10)
                
                BoutonOrange(text: "Valider", width: 115, height: 50) {
                    if repasVM.isValidCreateRepas() {
                        Task {
                            await repasVM.createRepas()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            repasVM.resetRepasPicker()
                        }
                        
                        switch origin {
                        case .dashboard:
                            showRepasModal = false
                        case .repasList:
                            navigationVM.path.removeLast()
                        }
                    
                    }else{
                        showAlertNoValid.toggle()
                    }
                }.padding(.bottom,5)
                
                BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {
                   
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        repasVM.resetRepasPicker()
                    }
                 
                        
                    switch origin {
                          case .dashboard:
                              showRepasModal = false
                          case .repasList:
                              navigationVM.path.removeLast()
                          }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Nouveau Repas")
                        .font(.system(size: 24, weight: .bold))
                }
            }.navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    Task {
                        await repasVM.fetchRepas()
                        await repasVM.fetchConsos()
                        await repasVM.fetchAliments()
                    }
                }
        }
        .sheet(isPresented: $showScanModal) {
            ScanModal()
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $showAjouterModal) {
            AjoutAliment(showAjouterModal: $showAjouterModal)
                .presentationDetents([.fraction(0.8)])
        }
        .alert("Validation impossible", isPresented: $showAlertNoValid) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Vous n'avez pas rempli tous les champs!")
        }
        .fullScreenCover(isPresented: $showPremiumPage) {
            PremiumPage(showPremiumPage: $showPremiumPage)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AjoutRepas(showRepasModal: .constant(false), origin: .repasList)
        .environment(NavigationViewModel())
        .environment(RepasViewModel())
}




