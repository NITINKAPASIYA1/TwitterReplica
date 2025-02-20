//
//  ProfileViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 20/02/25.
//

import Foundation

class ProfileViewModel : ObservableObject{
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    private let service  = TweetService()
    private let userService  = UserService()
    
    let user : User
    
    
    init(user:User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    
    var actionButtonTitle : String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
            case .tweets:
                return tweets
            case .replies:
                return tweets
            case .likes:
                return likedTweets
        }
    }
    

    func fetchUserTweets(){
        guard let id = user.id else { return }
        service.fetchTweetss(forUid: id) { tweet in
            self.tweets = tweet
            
            for i in 0..<tweet.count {
                self.tweets[i].user = self.user
                
            }
        }
    }
    
    func fetchLikedTweets(){
        guard let id = user.id else { return }
        service.fetchLikedTweets(forUid: id) { tweets in
            self.likedTweets = tweets
            
            for i in 0 ..< tweets.count{
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
            
            
        }
    }
}
