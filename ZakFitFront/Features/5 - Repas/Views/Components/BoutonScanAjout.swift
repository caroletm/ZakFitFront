//
//  BoutonScanAjout.swift
//  ZakFitFront
//
//  Created by caroletm on 27/11/2025.
//

import SwiftUI

struct BoutonScanAjout: View {
    
    var image : String
    var text : String
    var colorText : Color
    var colorButton : Color
    
    var function: () -> Void = {}
    
    var body: some View {
        Button {
            function()
        }label:{
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 170, height: 90)
                    .foregroundStyle(colorButton)
                VStack {
                    Image(systemName: image)
                        .font(.system(size: 32))
                    Text(text)
                        .font(.system(size: 10, weight: .semibold))
                        .padding(.vertical,5)
                }.foregroundStyle(colorText)
            }
        }
    }
}
