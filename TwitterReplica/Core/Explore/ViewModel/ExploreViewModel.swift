//
//  ExploreViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 18/02/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var searchText : String =  ""
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchAllUsers { users in
            self.users = users
//            print("DEBUG: Users are \(users)")
        }
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        }
        else {
            let lowercasedSearchText = searchText.lowercased()
            return users.filter {
                $0.username.lowercased().contains(lowercasedSearchText) || $0.fullname.lowercased().contains(lowercasedSearchText)
            }
        }
    }

}
