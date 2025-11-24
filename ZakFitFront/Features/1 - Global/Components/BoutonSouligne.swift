//
//  BoutonSouligne.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct BoutonSouligne: View {
    
    var text : String
    var color : Color
    var fontSize : CGFloat
    var fontWeight : Font.Weight
    var function : () -> Void = {}
    
    var body: some View {
        
        Button {
            function()
        }label: {
            Text(text)
                .foregroundStyle(color)
                .font(.system(size: fontSize, weight: fontWeight))
                .underline()
        }
    }
}
#Preview {
    BoutonSouligne(text: "Inscrivez-vous", color:.black, fontSize: 18, fontWeight: .bold)
}
