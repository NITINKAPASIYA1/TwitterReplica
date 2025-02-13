//
//  SideMenuViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import Foundation

enum SideMenuViewModel: Int,CaseIterable {
    case profile
    case list
    case bookmarks
    case logout
    
    var title : String {
        switch self {
            case .profile:
                return "Profile"
            case .list:
                return "List"
            case .bookmarks:
                return "Bookmarks"
            case .logout:
                return "Logout"
        }
    }
    
    var imageName : String {
        switch self {
            case .profile:
                return "person"
            case .list:
                return "list.bullet"
            case .bookmarks:
                return "bookmark"
            case .logout:
                return "arrow.left.square"
        }
    }
    
    
}
