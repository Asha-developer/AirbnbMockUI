//
//  DestinationSearchView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-12.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var shouldShowDestinationSearchView: Bool
    @ObservedObject var viewModel: ExploreViewModel

    @State private var selectedOption: DestinationSearchOptions = .location
    
    @State private var startDate: Date = .now
    @State private var endDate: Date = .now+86400
    
    @State private var numberOfGuests: Int = 2

    var body: some View {
        VStack(alignment: .leading, spacing: 50.0) {
            
            HStack {
                cancelButton
                Spacer()
                if selectedOption == .location && !viewModel.searchLocation.isEmpty {
                    clearButton
                }
            }
            
            VStack(alignment: .leading, spacing: 32.0) {
                if selectedOption == .location {
                    location
                } else {
                    collapsedLocation
                        .onTap {
                            selectedOption = .location
                        }
                }
                
                if selectedOption == .dates {
                    dates
                } else {
                    collapsedDates
                        .onTap {
                            selectedOption = .dates
                        }
                }
                
                if selectedOption == .guests {
                    guests
                } else {
                    collapsedLocation
                        .onTap {
                            selectedOption = .guests
                        }
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    private var cancelButton: some View {
        Button {
            withAnimation(.snappy) {
                shouldShowDestinationSearchView = false
            }
        } label : {
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundStyle(.black)
                .background {
                    Circle()
                        .stroke(.gray, lineWidth: 1.0)
                        .frame(width: 24.0, height: 24.0)
                }
        }
    }
    
    private var clearButton: some View {
        Button("Clear") {
            viewModel.searchLocation = ""
            viewModel.isSearching = false
        }
        .foregroundStyle(.black)
        .font(.subheadline)
        .fontWeight(.semibold)
    }
    
    private var location: some View {
        VStack(alignment: .leading, spacing: 2.0) {
            Text("Where to?")
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .imageScale(.small)
                
                TextField("Search Destinations", text: $viewModel.searchLocation)
                    .font(.subheadline)
                    .onSubmit {
                        viewModel.searchLocation = viewModel.searchLocation
                        viewModel.updateListings()
                        shouldShowDestinationSearchView = false
                    }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8.0).stroke(lineWidth: 1.0)
                    .foregroundStyle(Color(.systemGray4))
            }
            .padding(.vertical)
        }
        .addShadow()
    }
    
    private var collapsedLocation: some View {
        collapsedView(title: "Where", description: "Add destination")
    }
    
    private var dates: some View {
        VStack(alignment: .leading) {
            Text("When's your trip?")
                .font(.title2)
                .fontWeight(.semibold)
            
            DatePicker("From", selection: $startDate,in: Date.now...Date(timeIntervalSinceNow: 31536000), displayedComponents: .date)
                .foregroundStyle(.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Divider()
            
            DatePicker("To", selection: $endDate, in: (Date.now+86400)...Date(timeIntervalSinceNow: 34128000), displayedComponents: .date)
                .foregroundStyle(.gray)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .padding(.vertical)
        .addShadow()
    }
    
    private var collapsedDates: some View {
        collapsedView(title: "When", description: "Add dates")
    }
    
    private var guests: some View {
        VStack(alignment: .leading) {
            Text("Who's coming?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Stepper {
                Text("\(numberOfGuests) Adults")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            } onIncrement: {
                numberOfGuests += 1
            } onDecrement: {
                guard numberOfGuests > 0 else { return }
                numberOfGuests -= 1
            }
        }
        .addShadow()
    }
    
    private var collapsedGuests: some View {
        collapsedView(title: "Who", description: "Add guests")
    }
    
    private func collapsedView(title: String, description: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.gray)
            Spacer()
            Text(description)
        }
        .frame(minHeight: 32.0)
        .fontWeight(.semibold)
        .font(.subheadline)
        .addShadow()
    }
}

#Preview {
    DestinationSearchView(shouldShowDestinationSearchView: .constant(false), viewModel: .init())
}
