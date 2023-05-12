//
//  NotificationController.swift
//  WatchLandmark Watch App
//
//  Created by Богдан Радченко on 12.05.2023.
//

import SwiftUI
import UserNotifications
import WatchKit

final class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationsData = notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationsData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationsData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
