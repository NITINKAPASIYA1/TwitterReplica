//
//  TweetFilterViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import Foundation


enum TweetFilterViewModel : Int, CaseIterable {
    case tweets, replies, likes
    
    var title: String {
        switch self {
            case .tweets:
                return "Tweets"
            case .replies:
                return "Replies"
            case .likes:
                return "Likes"
        }
    }
}
