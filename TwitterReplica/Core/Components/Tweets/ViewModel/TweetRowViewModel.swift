//
//  TweetRowViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 21/02/25.
//

import SwiftUI

class TweetRowViewModel: ObservableObject {
    
    @Published var tweet : Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    
}
