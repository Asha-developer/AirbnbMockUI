//
//  ExploreService.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-15.
//

import Foundation

final class ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        DeveloperPreview.shared.listing
    }
}
