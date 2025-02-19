//
//  ProfileViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 20/02/25.
//

import Foundation

class ProfileViewModel : ObservableObject{
    @Published var tweets = [Tweet]()
    private let service  = TweetService()
    let user : User
    
    init(user:User){
        self.user = user
        self.fetchUserTweets()
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
    
}
