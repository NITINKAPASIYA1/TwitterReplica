//
//  TweetService.swift
//  TwitterReplica
//
//  Created by Nitin on 20/02/25.
//

import Firebase
import FirebaseAuth

struct TweetService {
    
    
    func uploadTweet(completion:@escaping(Bool) -> Void ,caption:String){
        guard let uid  = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid":uid,
                    "caption":caption,
                    "likes":0,
                    "timestamp":Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error  {
                    print("DEBUG: Error uploading tweet \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
                print("DEBUG: Tweet uploaded successfully")
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp",descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let tweets = documents.compactMap ({ try? $0.data(as: Tweet.self)})
            print(tweets)
            completion(tweets)
        }
    }
    
    func fetchTweetss(forUid uid : String,completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let tweets = documents.compactMap ({ try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
        }
    }
    
    
}

