//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Leone on 1/13/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    
    // Setup the properties for the Notification
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    
    var body: some View {
        VStack {
            // Ensure a landmark exists
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit() // Makes it fit within the parent view
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text("You are within 5 miles of one of your favorite landmarks")
                .font(.caption)
        }
        .lineLimit(0)
        
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            NotificationView()
        }
        NotificationView(title: "Turtle Rock", message: "You are within 5 miles of Turtle Rock.", landmark: ModelData().landmarks[0])
    }
}
