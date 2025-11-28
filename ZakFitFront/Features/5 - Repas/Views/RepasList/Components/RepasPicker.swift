//
//  RepasPicker.swift
//  ZakFitFront
//
//  Created by caroletm on 28/11/2025.
//

import SwiftUI

struct RepasPicker: View {
    
    @Binding  var selectedTab: Int
    @Binding var tabs : [String]
    
    var body: some View {
        ZStack {
          
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.greyDark)
                .frame(height: 30)
            
            GeometryReader { geo in
                let segmentWidth = geo.size.width / CGFloat(tabs.count)
                
                // Slider animé
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orangeLight50)
                    .frame(width: segmentWidth, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orangeLight300, lineWidth: 1)
                    )
                    .offset(x: CGFloat(selectedTab) * segmentWidth)
                    .animation(.easeInOut(duration: 0.2), value: selectedTab)
                
                // Les textes des segments
                HStack(spacing: 0) {
                    ForEach(tabs.indices, id: \.self) { index in
                        Text(tabs[index])
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: segmentWidth, height: 30)
                            .foregroundStyle(selectedTab == index ? Color.orangeLight300 : Color.white)
                            .contentShape(Rectangle()) // pour que le tap prenne tout le segment
                            .onTapGesture {
                                selectedTab = index
                            }
                    }
                }
            }
            .frame(height: 30)
        }
        .frame(width: 330, height: 30)
    }
}

#Preview {
    RepasPicker(selectedTab: .constant(0), tabs: .constant(["Tous les jours", "Par journée"]))
}
