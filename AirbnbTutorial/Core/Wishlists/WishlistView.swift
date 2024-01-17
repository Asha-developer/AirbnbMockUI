//
//  WishlistView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-15.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Wishlists")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("Log in to view your wishlists.")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlists once you've logged in.")
                        .font(.footnote)
                }
                .padding()
                
                Button(action: {}, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                })
                .padding()
                .frame(minWidth: 360.0)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                .padding(.top)
                
                Spacer()
            }
            .padding(.top, 32.0)
        }
        .navigationTitle("Wishlists")
    }
}

#Preview {
    WishlistView()
}
