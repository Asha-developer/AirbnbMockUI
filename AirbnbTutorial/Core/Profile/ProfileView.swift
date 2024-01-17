//
//  ProfileView.swift
//  AirbnbTutorial
//
//  Created by bubu on 2024-01-15.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Log in to start planning your next trip")
                .padding(.bottom, 24.0)
            
            Button(action: {}, label: {
                Text("Log in")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            })
            .padding()
            .frame(minWidth: 360.0)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            .padding(.bottom, 24.0)
            
            Text("Don't have an account? ")
                .font(.caption)
            + Text("Sign up")
                .underline()
                .fontWeight(.semibold)
                .font(.caption)
            
            imageAndTextView(imageName: "gear", text: "Settings")
            
            imageAndTextView(imageName: "gear", text: "Accessibility")
            
            imageAndTextView(imageName: "questionmark.circle", text: "Visit the help centre")
        }
        .padding()
    }
    
    private func imageAndTextView(imageName: String, text: String) -> some View {
        VStack(spacing: 12.0) {
            HStack {
                Label(text, systemImage: imageName)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            Divider()
        }
        .padding(.top)
    }
}

#Preview {
    ProfileView()
}
