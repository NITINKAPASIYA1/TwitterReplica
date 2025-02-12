//
//  TweetFilterViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import Foundation


enum TweetFilterViewModel : Int, CaseIterable {
    case Tweets, Replies, Likes
    
    var title: String {
        switch self {
            case .Tweets:
                return "Tweets"
            case .Replies:
                return "Replies"
            case .Likes:
                return "Likes"
        }
    }
}
