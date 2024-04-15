//
//  aboutAppView.swift
//  project0622
//
//  Created by BB on 24/04/2024.
//

import SwiftUI

struct aboutAppView: View {
    var body: some View {
    
        ScrollView {
    
            VStack(alignment: .leading, spacing: 20) {
            
                Image("YourLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.top)

                Text("About Our App")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("This is a comprehensive App, integrating a variety of professional tools and services to provide users with the best experience.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    
                Text("Version 1.0.0")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("© 2024 Your Company")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }.padding()

        }.navigationBarTitle("About", displayMode: .inline)
    }
}

#Preview {
    aboutAppView()
}
