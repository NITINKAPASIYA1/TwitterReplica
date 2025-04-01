//
//  TwitterReplicaApp.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI
import Firebase


@main
struct TwitterReplicaApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
