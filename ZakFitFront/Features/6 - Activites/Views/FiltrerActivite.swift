//
//  FiltrerActivite.swift
//  ZakFitFront
//
//  Created by caroletm on 29/11/2025.
//

import SwiftUI

struct FiltrerActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    @State var showPickerMinutes : Bool = false
    
    var body: some View {
        
        @Bindable var activiteVM = activiteVM
        
        NavigationView{
            
            VStack{
                
                VStack (alignment :.leading){
                    
                    HStack {
                        Text("Par type :")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                    }
                    
                    ScrollView(.horizontal){
                        HStack {
                            ForEach(TypeActivite.allCases, id: \.self) { type in
                                Button {
                                    
                                    if activiteVM.selectedActivite == type {
                                        activiteVM.selectedActivite = nil
                                    }else{
                                        activiteVM.selectedActivite = type
                                    }
                                    
                                }label: {
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 63, height: 63)
                                            .foregroundStyle(activiteVM.selectedActivite == type ? Color.greyDark : Color.greyLight100)
                                        VStack {
                                            Image(systemName: type.imageName)
                                                .font(.system(size: 24))
                                                .padding(.bottom, 3)
                                            
                                            Text(type.description)
                                                .font(.system(size: 8, weight: .bold))
                                            
                                        }  .foregroundStyle(activiteVM.selectedActivite == type ? Color.white : Color.greyDark)
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                HStack{
                    Text("Par durée :")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    
                    Button {
                        showPickerMinutes.toggle()
                    }label:{
                        if activiteVM.selectedDuree == nil {
                            Text("Définir")
                        }else{
                            Text("\(activiteVM.selectedDuree ?? 0) minutes")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(Color.black)
                        }
                    }
                
                    
                    
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                HStack{
                    Text("Par date :")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    
                    DatePicker(
                        "",
                        selection: $activiteVM.dateActivite,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .datePickerStyle(.compact)
                    
                    
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                VStack {
                    HStack{
                        Text("Par calories brûlées :")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                        
                        Text("\(Int(activiteVM.minCaloriesBrulees))")
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .background(Color.greyLight50)
                            .cornerRadius(10)
                            .foregroundStyle(Color.orangeLight300)
                        
                        
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    
                    Slider(value: $activiteVM.minCaloriesBrulees, in: 0...5000)
                        .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                }
                
                if activiteVM.isFilterActive {
                    Button {
                        activiteVM.resetFilter()
                    }label:{
                        Text("Vider les filtres")
                    }
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
                }
                
                Spacer()
                
                BoutonOrange(text: "Valider", width: 115, height: 50) {
                    navigationVM.path.removeLast(1)
                }.padding(.bottom,5)
                
                BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {
                    activiteVM.resetFilter()
                }
                
            }
            .padding(.top, 40)
            .toolbar {
                ToolbarItem (placement: .principal) {
                    Text("Filtrer mes repas")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await activiteVM.fetchActivites()
                }
            }
        }
        .sheet(isPresented: $showPickerMinutes) {
            
            Picker("Minutes", selection: $activiteVM.selectedDuree) {
                ForEach(0..<200, id: \.self) { i in
                    Text("\(i) minutes").tag(i)
                }
            }
            .presentationDetents([.fraction(0.3)])
            .pickerStyle(.wheel)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    FiltrerActivite()
        .environment(NavigationViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
}
