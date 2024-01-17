//
//  ShadowView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-12.
//

import SwiftUI

struct ShadowView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .shadow(radius: 10.0)
    }
}

extension View {
    
    func addShadow() -> some View {
        modifier(ShadowView())
    }
}
