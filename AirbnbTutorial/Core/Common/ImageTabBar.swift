//
//  ImageTabBar.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-10.
//

import SwiftUI

struct ImageTabBar: View {
    
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ImageTabBar(listing: DeveloperPreview.shared.listing.first!)
}
