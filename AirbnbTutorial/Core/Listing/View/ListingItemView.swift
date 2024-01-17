//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-09.
//

import SwiftUI

struct ListingItemView: View {
    
    private let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6.0) {
            ImageTabBar(listing: listing)
                .frame(height: 320.0)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
            HStack(spacing: 2.0) {
                Text("\(listing.city), \(listing.state)")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "star.fill")
                    .tint(.primary)
                Text("\(listing.rating, specifier: "%.2f")")
                    .foregroundStyle(.black)
            }
            
            Text("12 mi away")
                .foregroundStyle(.gray)
            
            Text("Nov 3 - 10")
                .foregroundStyle(.gray)
            
            Text("$\(listing.pricePerNight)")
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            + Text(" ")
            + Text("night")
                .foregroundStyle(.black)
        }
        .font(.footnote)
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listing.first!)
}
