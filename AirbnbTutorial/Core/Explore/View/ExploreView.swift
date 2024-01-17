//
//  ExploreView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-09.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var shouldShowDestinationSearchView: Bool = false
    @StateObject private var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            if shouldShowDestinationSearchView {
                DestinationSearchView(shouldShowDestinationSearchView: $shouldShowDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView {
                    LazyVStack {
                        SearchAndFilterBar(viewModel: viewModel, shouldShowDestinationSearchView: $shouldShowDestinationSearchView)
                            .contentShape(Rectangle()) // to fix user tap recognization
                            .onTap {
                                shouldShowDestinationSearchView = true
                            }
                        
                        ForEach(viewModel.isSearching ? viewModel.filteredListings : viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .onAppear {
                                        if listing.id == viewModel.listings.last?.id {
                                            // load more data here
                                        }
                                    }
                            }
                        }
                    }
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
