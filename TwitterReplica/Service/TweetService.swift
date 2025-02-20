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
    
    func likeTweet(_ tweet:Tweet,completion: @escaping () -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        let userLikeRef = Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
        
        Firestore.firestore()
            .collection("tweets")
            .document(tweetId)
            .updateData(["likes":tweet.likes + 1]) { _ in
                userLikeRef.document(tweetId).setData(["timestamp":Timestamp(date: Date())])
                completion()
            }
    }
    
    func tweetUnlike(_ tweet:Tweet,completion: @escaping () -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        Firestore.firestore()
            .collection("tweets")
            .document(tweetId)
            .updateData(["likes":tweet.likes - 1]) { _ in
                Firestore.firestore()
                    .collection("users")
                    .document(uid)
                    .collection("user-likes")
                    .document(tweetId)
                    .delete { _ in
                        completion()
                    }
            }
    }
    
    func checkIfUserLikedTweet(_ tweet:Tweet,completion:@escaping (Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        guard tweet.likes > 0 else {return}
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
            .document(tweetId)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedTweets(forUid uid:String,completion:@escaping ([Tweet]) -> Void){
        var tweets = [Tweet]()
        
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                documents.forEach { doc in
                    let TweeetId = doc.documentID
                    
                    Firestore.firestore()
                        .collection("tweets")
                        .document(TweeetId)
                        .getDocument { snapshot, _ in
                            guard let tweet = try? snapshot?.data(as: Tweet.self) else {return}
                            tweets.append(tweet)
                            completion(tweets)
                        }
                }
            }
        
    }
    
    
}


