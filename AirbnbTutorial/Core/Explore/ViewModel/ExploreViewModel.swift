//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-15.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listings: [Listing] = []
    @Published var filteredListings: [Listing] = []
    @Published var searchLocation: String = ""
    @Published var isSearching: Bool = false

    private let service: ExploreService
    private var page: Int = 1
    
    init(service: ExploreService = .init()) {
        self.service = service
        Task {
            await fetchListings()
        }
    }
    
    @MainActor
    private func fetchListings() async {
        do {
            // when the backend supports, pass the page no. to receive a set no. of listings
            page += 1
            listings = try await service.fetchListings()
        } catch {}
    }

    func updateListings() {
        filteredListings = listings.filter { $0.city.lowercased() == searchLocation.lowercased() || $0.state.lowercased() == searchLocation.lowercased() }
        isSearching = true
    }
}
