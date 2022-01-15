//
//  NotificationController.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Leone on 1/13/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    // Use this key to extract the index of the landmark
    let lanmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        // Instantiates the previous notification View
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        let modelData = ModelData()
        
        // Get the dictionary of results back from the user
        let notificationData = notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        // Updates the notifications body properties
        title = alert?["title"] as? String
        message = alert?["message"] as? String
        
        if let index = notificationData?[lanmarkIndexKey] as? Int {
            // Update the current landmark 
            landmark = modelData.landmarks[index]
        }
        
    }
}
