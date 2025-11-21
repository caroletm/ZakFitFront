//
//  ProfilOnboarding.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct ProfilOnboarding: View {
    
    var user: User
    
    @State var nom = ""
    @State var prenom = ""
    @State var taille = 155
    @State var poids = 59
    @State var sexe : UserGender? = nil
    @State var age : Int = 33
    @State var preference : UserPreferences = .glutenFree
    @State var activityLevel : UserActivityLevel = .high
    
    var body: some View {
        
        VStack {
            VStack {
                Button {
                    //
                }label:{
                    Image(user.image)
                }
                Text(user.username)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.orangeLight300)
                Text(user.email)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.greyDark)
            }
            Spacer()
                .frame(height: 40)
            
            VStack {
                HStack {
                    Text("Nom")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    Spacer()
                    TextField("Nom", text: $nom)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.greyLight50)
                        .cornerRadius(10)
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 187)
                    
                }
                .padding(.horizontal)
                HStack {
                    Text("Prénom")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    Spacer()
                    TextField("Prénom", text: $prenom)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.greyLight50)
                        .cornerRadius(10)
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 187)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Taille")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    Spacer()
                    Picker("Taille", selection: $taille) {
                        ForEach(100...200, id: \.self) {
                            Text("\($0) cm")
                        }
                    }.pickerStyle(.automatic)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Poids")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    Spacer()
                    Picker("Poids", selection: $poids) {
                        ForEach(30...200, id: \.self) {
                            Text("\($0) kg")
                        }
                    }.pickerStyle(.automatic)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Sexe")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    Spacer()
                    Picker("Sexe", selection: $sexe) {
                        ForEach(UserGender.allCases, id: \.self) { gender in
                            Text(gender.description)
                                .tag(gender)
                        }
                    }.pickerStyle(.automatic)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Age")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    Spacer()
                    Picker("Age", selection: $age) {
                        ForEach(18...150, id: \.self) {
                            Text("\($0) ans")
                        }
                    }.pickerStyle(.automatic)
                }
                .padding(.horizontal)
                
                VStack (alignment: .leading){
                    Text("Préférences alimentaires")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    
                    StyledPicker(selection: $preference, labelFor: { $0.description })
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .vertical], 10)
                
                VStack(alignment: .leading) {
                    Text("Niveau d'activité")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    
                    StyledPicker(selection: $activityLevel, labelFor: { $0.description })
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .bottom], 10)
                
                VStack(alignment: .leading){
                    Text("Objectifs de santé")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.orangeLight300)
                    BoutonSouligne (text: "Renseigner mes objectifs", color: .black, fontSize: 16, fontWeight: .medium) {
                    }
                    .padding(.vertical,5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .top], 10)
            }
            
        }
    }
}

#Preview {
    ProfilOnboarding(user : firstUser)
}
