//
//  ListingDetailView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-10.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    private let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(
        listing: Listing
    ) {
        self.listing = listing
        _cameraPosition = .init(
            initialValue: .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: listing.latitude,
                        longitude: listing.longitude
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.1,
                        longitudeDelta: 0.1
                    )
                )
            )
        )
    }

    var body: some View {
        VStack(spacing: 0.0) {
            ScrollView {
                VStack(alignment: .leading) {
                    ImageTabBar(listing: listing)
                        .frame(height: 320.0)
                    
                    propertyDetails
                    
                    Divider()
                    
                    hostDetails
                    
                    Divider()
                    
                    moreDetails
                    
                    Divider()
                    
                    sleepDetails
                    
                    Divider()
                    
                    propertyOffers
                    
                    Divider()
                    
                    location
                }
            }
            .ignoresSafeArea()
            
            stickyFooter
        }
        .floatingBackButton()
        .toolbar(.hidden, for: .tabBar)
    }
    
    private var propertyDetails: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            VStack(alignment: .leading) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack(spacing: 2.0) {
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating, specifier: "%.2f") ")
                    + Text(" - ")
                    + Text("28 reviews")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                
                Text("\(listing.city), \(listing.state)")
                    .font(.caption)
            }
            .padding(.horizontal)
        }
    }
    
    private var hostDetails: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                    
                    Spacer(minLength: 80.0)
                }
                Text("\(listing.numberOfGuests) guests - \(listing.numberOfBedrooms) bedrooms - \(listing.numberOfBeds) beds - \(listing.numberOfBathrooms) baths")
                    .font(.footnote)
            }
            
            Spacer()
            
            Image(listing.ownerImageURL)
                .resizable()
                .frame(width: 64.0, height: 64.0)
                .scaledToFill()
                .clipShape(Circle())
        }
        .padding()
    }
    
    private func imageTextView(imageName: String, title: String, description: String) -> some View {
        HStack(spacing: 12.0) {
            Image(systemName: imageName)
            
            VStack(alignment: .leading, spacing: 2.0) {
                Text(title)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
    
    private var moreDetails: some View {
        VStack(
            alignment: .leading,
            spacing: 14.0
        ) {
            ForEach(listing.features, id: \.self) { feature in
                imageTextView(
                    imageName: feature.image,
                    title: feature.title,
                    description: feature.subtitle
                )
            }
        }
        .padding()
    }
    
    private var sleepDetails: some View {
        VStack(alignment: .leading) {
            Text("Where you'll sleep")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16.0) {
                    ForEach(0 ..< listing.numberOfBedrooms, id: \.self) { bedroom in
                        HStack() {
                            VStack(alignment: .leading, spacing: 8.0) {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom + 1)")
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: 132.0, height: 100.0)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12.0)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(.gray)
                        }
                        
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
        .padding()
    }
    
    private var propertyOffers: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text("What this place offers")
                .font(.headline)
            
            Group {
                ForEach(listing.amenities) { amenity in
                    Label(amenity.title, systemImage: amenity.imageName)
                }
            }
            .font(.footnote)
        }
        .padding()
    }
    
    private var location: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text("Where you'll be")
                .font(.headline)
            
            Map(position: $cameraPosition)
                .frame(height: 200.0)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
        }
        .padding()
    }
    
    private var stickyFooter: some View {
        VStack {
            Divider()
                .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("$\(listing.pricePerNight)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("Total before taxes")
                    
                    Text("Oct 15 - 20")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Reserve")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .tint(.white)
                        .frame(minWidth: 140.0, minHeight: 40.0)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                }
                .padding(.trailing, 5.0)
            }
            .padding(.horizontal)
        }
        .background(.white)
        .frame(alignment: .bottom)
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listing.first!)
}
