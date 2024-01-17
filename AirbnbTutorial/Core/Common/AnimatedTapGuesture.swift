//
//  AnimatedTapGesture.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-12.
//

import SwiftUI

struct AnimatedTapGesture: ViewModifier {
    
    private var onTap: () -> Void
    
    init(onTap: @escaping () -> Void) {
        self.onTap = onTap
    }
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                withAnimation(.snappy) {
                    onTap()
                }
            }
    }
}

extension View {
    
    func onTap(_ onTap: @escaping () -> Void) -> some View {
        modifier(AnimatedTapGesture(onTap: onTap))
    }
}
