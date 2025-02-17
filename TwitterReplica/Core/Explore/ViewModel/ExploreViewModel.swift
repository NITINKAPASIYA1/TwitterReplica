//
//  ExploreViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 18/02/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchAllUsers { users in
            self.users = users
            print("DEBUG: Users are \(users)")
        }
    }

}
