//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Leone on 1/13/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    // Create computed property
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // Display image of landmark
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit() // Makes circle larger to fit the entire screen
                
                // Display the landmark name under the app
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0) // Prevents it from going underneath
                
                // Create a favorite button toggle
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                // MARK: - Park/ State
                // Makes grey line/ divider
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                // MARK: - Map View
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                
            }
            .padding(16)
        }
        // Sets the title for the back button   
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        
       
        return Group {
        
            // Test against the largest
            LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
            .previewDevice("Apple Watch Series 5 - 45mm")
            
            // And smallest devices
            LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
            .previewDevice("Apple Watch Series 5 - 40mm")
            
        }
        
    }
}
