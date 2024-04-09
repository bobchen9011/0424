//
//  goApp.swift
//  go
//
//  Created by Ping chi Chen on 2022/12/8.
//

import SwiftUI
import Firebase

@main
struct goApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool { FirebaseApp.configure()

    return true
  }
}
