//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/02/24.
//

import SwiftUI
import FirebaseCore

class AppDeleate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct AppetizerApp: App {
    // register App Delegate for firebase setup
    @UIApplicationDelegateAdaptor(AppDeleate.self) var delegate
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerView()
                .environmentObject(order)
        }
    }
}
