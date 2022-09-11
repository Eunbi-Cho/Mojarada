//
//  MojaradaApp.swift
//  Mojarada WatchKit Extension
//
//  Created by 조은비 on 2022/06/29.
//

import SwiftUI

@main
struct MojaradaApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                LogView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
