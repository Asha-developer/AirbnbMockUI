//
//  DeveloperPreview.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-15.
//

import Foundation

final class DeveloperPreview {
    
    static var shared = DeveloperPreview()
    
    var listing: [Listing] = [
        
        .init(
            id: UUID().uuidString,
            type: .house,
            ownerId: UUID().uuidString,
            ownerName: "Michael Scott",
            ownerImageURL: "michael",
            numberOfBeds: 4,
            numberOfBedrooms: 5,
            numberOfBathrooms: 4,
            numberOfGuests: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURLs: [
                "listing1",
                "listing2",
                "listing3",
                "listing4"
            ],
            address: "124 Main st",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [
                .selfCheckIn,
                .superHost
            ],
            amenities: [
                .wifi,
                .alarmSystem,
                .balcony,
                .laundry,
                .tv
            ]
        ),
        .init(
            id: UUID().uuidString,
            type: .townHouse,
            ownerId: UUID().uuidString,
            ownerName: "Harvey specter",
            ownerImageURL: "harvey_specter",
            numberOfBeds: 4,
            numberOfBedrooms: 6,
            numberOfBathrooms: 4,
            numberOfGuests: 4,
            pricePerNight: 763,
            latitude: 34.2,
            longitude: -118.0426,
            imageURLs: [
                "listing2",
                "listing1",
                "listing3",
                "listing4"
            ],
            address: "124 Main st",
            city: "Los angeles",
            state: "California",
            title: "Beautiful los angeles home in malibu",
            rating: 4.86,
            features: [
                .selfCheckIn,
                .superHost
            ],
            amenities: [
                .wifi,
                .pool,
                .tv
            ]
        ),
        .init(
            id: UUID().uuidString,
            type: .villa,
            ownerId: UUID().uuidString,
            ownerName: "Harvey specter",
            ownerImageURL: "harvey_specter",
            numberOfBeds: 4,
            numberOfBedrooms: 3,
            numberOfBathrooms: 4,
            numberOfGuests: 4,
            pricePerNight: 967,
            latitude: 40.7128,
            longitude: 74.0060,
            imageURLs: [
                "listing3",
                "listing2",
                "listing1",
                "listing4"
            ],
            address: "124 Main st",
            city: "NYC",
            state: "New york",
            title: "NY Villa",
            rating: 4.86,
            features: [
                .selfCheckIn,
                .superHost
            ],
            amenities: [
                .wifi,
                .alarmSystem,
                .balcony,
                .laundry,
                .tv
            ]
        )
        
    ]
}
