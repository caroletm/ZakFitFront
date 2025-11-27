//
//  AjoutActivites.swift
//  ZakFitFront
//
//  Created by caroletm on 26/11/2025.
//

import SwiftUI

struct AjoutActivite: View {
    @Environment(NavigationViewModel.self) var navigationVM
    
    @State var dateActivite: Date = Date()
    @State var selectedActivite : TypeActivite? = nil
    @State var selectedDuree : Int? = nil
    @State var showPickerMinutes : Bool = false
    @State var showPickerDebut : Bool = false
    @State var caloriesBruleesString : String = "0"
    @State var caloriesBrulees : Int? = nil
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                HStack {
                    Text("Date :")
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    DatePicker(
                        "",
                        selection: $dateActivite,
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
                                    
                                    if selectedActivite == type {
                                        selectedActivite = nil
                                    }else{
                                        selectedActivite = type
                                    }
                                    
                                }label: {
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 63, height: 63)
                                            .foregroundStyle(selectedActivite == type ? Color.greyDark : Color.greyLight100)
                                        VStack {
                                            Image(systemName: type.imageName)
                                                .font(.system(size: 24))
                                                .padding(.bottom, 3)
                                            
                                            Text(type.description)
                                                .font(.system(size: 8, weight: .bold))
                                            
                                        }  .foregroundStyle(selectedActivite == type ? Color.white : Color.greyDark)
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
                        if selectedDuree == nil {
                            Text("Définir")
                        }else{
                            Text("\(selectedDuree ?? 0) minutes")
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
                    
                    TextField("", text: $caloriesBruleesString)
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
                            caloriesBrulees = Int(caloriesBruleesString)
                        }
                    
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                Spacer()
    
                Text("Cette activité consomme à peu près 500 calories")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.greyDark)
                    .italic()
                    .frame(width: 320)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 80, trailing: 10))
                
                BoutonOrange(text: "Valider", width: 115, height: 50) {
                    //
                }.padding(.bottom,5)
                BoutonSouligne(text: "Annuler", color: Color.black, fontSize: 16, fontWeight: .bold) {

                }
                .padding(.bottom, 10)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Nouvelle activité")
                        .font(.system(size: 24, weight: .bold))
                }
            }.navigationBarTitleDisplayMode(.inline)
            
        }.sheet(isPresented: $showPickerMinutes) {
            
            Picker("Minutes", selection: $selectedDuree) {
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
    AjoutActivite()
        .environment(NavigationViewModel())
}
