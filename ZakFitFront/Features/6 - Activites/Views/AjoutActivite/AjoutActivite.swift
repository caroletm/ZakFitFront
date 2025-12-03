//
//  AjoutActivites.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct AjoutActivite: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(ActiviteViewModel.self) var activiteVM
    
    @State var showPickerMinutes : Bool = false
    @State var showPickerDebut : Bool = false
    @Binding var showActiviteModal : Bool
    @State var caloriesBruleesString : String = ""
    
    enum AjoutActiviteOrigin {
        case dashboard
        case activiteList
    }
    
    let origin: AjoutActiviteOrigin
    
    var body: some View {
        
        @Bindable var activiteVM = activiteVM
        
        NavigationView {
            VStack{
                
                HStack {
                    Text("Date :")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    DatePicker(
                        "",
                        selection: $activiteVM.dateActivite,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .datePickerStyle(.compact)
                    
                }
                .padding(EdgeInsets(top: 30, leading: 10, bottom: 10, trailing: 10))
                
                VStack (alignment :.leading) {
                    
                    HStack {
                        Text("Selectionne le type :")
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
                
                HStack {
                    Text("Durée de ton activité :")
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
                
                    
                    
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                HStack {
                    Text("Calories brûlées :")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    
                    TextField("\(String(format: "%.0f", activiteVM.caloriesBruleesCalculees()))", text: $caloriesBruleesString)
                        .keyboardType(.numberPad)
                        .padding(8)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                        .background(Color.orangeLight100)
                        .multilineTextAlignment(.center)
                        .frame(width: 80, height: 40)
                        .cornerRadius(10)
                        .onChange(of: caloriesBruleesString) {
                            caloriesBruleesString = caloriesBruleesString.filter { $0.isNumber }
                            activiteVM.caloriesBrulees = Double(caloriesBruleesString)
                        }
                    
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                Spacer()
    
                Text("Cette activité consomme à peu près \(String(format: "%.0f", activiteVM.caloriesBruleesCalculees())) calories")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.greyDark)
                    .italic()
                    .frame(width: 320)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 80, trailing: 10))
                
                BoutonOrange(text: "Valider", width: 115, height: 50) {
                    
                    if activiteVM.isValidCreateActivite() {
                        
                        Task {
                            await activiteVM.createActivite()
                        }
//                        activiteVM.resetActivitePicker()
                        
                        switch origin {
                        case .dashboard:
                            showActiviteModal = false
                        case .activiteList:
                            navigationVM.path.removeLast()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            activiteVM.resetActivitePicker()
                        }
                    }
                    
                }.padding(.bottom,5)
                
                BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {
//                    activiteVM.resetActivitePicker()
                    
                    switch origin {
                    case .dashboard:
                        showActiviteModal = false
                    case .activiteList:
                        navigationVM.path.removeLast()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        activiteVM.resetActivitePicker()
                    }
                }
                .padding(.bottom, 10)
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Nouvelle activité")
                        .font(.system(size: 24, weight: .bold))
                }
            }.navigationBarTitleDisplayMode(.inline)
            
                .onAppear {
                    Task {
                        await activiteVM.fetchActivites()
                    }
                }
            
        }.sheet(isPresented: $showPickerMinutes) {
            
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
    AjoutActivite(showActiviteModal: .constant(false), origin: .activiteList)
        .environment(NavigationViewModel())
        .environment(ActiviteViewModel(userVM: userVM))
}
