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
        fetchUserLikedTweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func fetchUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    
    
    func unlikeTweet() {
        service.tweetUnlike(tweet) {
            if self.tweet.didLike! {
                self.tweet.didLike = false
            }
        }
    }
    
}
