//
//  UploadTweetViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 20/02/25.
//

import Foundation

class UploadTweetViewModel : ObservableObject{
    @Published var didUploadTweet = false
    let service  = TweetService()
    
    
    func uploadTweet(withcaption caption: String) {
        service.uploadTweet(completion: { success in
            if success {
                //dismiss the screen
                self.didUploadTweet = true
            }else {
                
            }
        }, caption: caption)
    }
}
