//
//  Listing.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-15.
//

import Foundation

struct Listing: Codable, Identifiable, Hashable {
    
    let id: String
    let type: ListingType
    
    let ownerId: String
    let ownerName: String
    let ownerImageURL: String
    
    let numberOfBeds: Int
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    
    let pricePerNight: Int
    
    let latitude: Double
    let longitude: Double
    
    let imageURLs: [String]
    let address: String
    let city: String
    let state: String
    
    let title: String
    let rating: Double
    
    let features: [ListingFeatures]
    let amenities: [ListingAmenities]
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad."
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are commited to providing greater stars for guests"
        }
    }
    
    var image: String {
        switch self {
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
    var id: Int { rawValue }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .wifi:
            return "Wifi"
        case .laundry:
            return "Laundry"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkerboard.shield"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcony:
            return "building"
        }
    }

    var id: Int { rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townHouse:
            return "Town House"
        case .villa:
            return "Villa"
        }
    }
    
    var id: Int { rawValue }
}
