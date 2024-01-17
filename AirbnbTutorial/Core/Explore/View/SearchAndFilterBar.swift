//
//  SearchAndFilterBar.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-10.
//

import SwiftUI

struct SearchAndFilterBar: View {
    
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var shouldShowDestinationSearchView: Bool
    
    var body: some View {
        HStack(spacing: 12.0) {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2.0) {
                Text(viewModel.isSearching ? viewModel.searchLocation : "Any")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Any week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button(action: {
                guard !viewModel.searchLocation.isEmpty else {
                    shouldShowDestinationSearchView = true
                    return
                }
                viewModel.isSearching.toggle()
                if viewModel.isSearching {
                    viewModel.updateListings()
                }
            }) {
                Image(systemName: viewModel.isSearching ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                    .tint(.black)
            }
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(radius: 2.0)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(viewModel: .init(), shouldShowDestinationSearchView: .constant(false))
}
