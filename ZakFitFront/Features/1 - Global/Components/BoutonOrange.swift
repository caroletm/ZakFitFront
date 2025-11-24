//
//  BoutonOrange.swift
//  ZakFitFront
//
//  Created by caroletm on 21/11/2025.
//

import SwiftUI

struct BoutonOrange: View {
    
    var text: String
    var width: CGFloat
    var height: CGFloat
    var function: () -> Void = {}
    
    var body: some View {
        Button {
            function()
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width, height: height)
                    .foregroundStyle(Color.orangeLight300)
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .bold))
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

#Preview {
    BoutonOrange(text: "Se connecter", width: 280, height: 50)
}
