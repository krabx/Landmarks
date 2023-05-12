//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Богдан Радченко on 22.04.2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
        
#if os(watchOS)
        WKNotificationScene(
            controller: NotificationController.self,
            category: "LandmarkNear"
        )
#endif
        
#if os(macOS)
        Settings {
            LandmarkSettings()
        }
#endif
    }
}
