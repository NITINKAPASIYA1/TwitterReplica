//
//  TwitterReplicaApp.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI
import Firebase
import UIKit

// Create an AppDelegate class that conforms to UIApplicationDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TwitterReplicaApp: App {
    // Use UIApplicationDelegateAdaptor to bridge SwiftUI and UIKit delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    // No need for init here anymore as Firebase is configured in AppDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
