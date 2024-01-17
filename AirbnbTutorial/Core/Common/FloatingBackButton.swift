//
//  FloatingBackButton.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-12.
//

import SwiftUI

struct FloatingBackButton: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss
    private let additionalDismissAction: () -> Void
    
    init(additionalDismissAction: @escaping () -> Void) {
        self.additionalDismissAction = additionalDismissAction
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: .topLeading) {
            content
            
            Button(action: {
                dismiss()
                additionalDismissAction()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32.0, height: 32.0)
                    }
            })
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
    }
}

extension View {
    
    func floatingBackButton(additionalDismissAction: @escaping () -> Void = {}) -> some View {
        modifier(FloatingBackButton(additionalDismissAction: additionalDismissAction))
    }
}
