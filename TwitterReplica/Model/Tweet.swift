//
//  Tweet.swift
//  TwitterReplica
//
//  Created by Nitin on 20/02/25.
//


import Firebase
import FirebaseFirestore

struct Tweet : Identifiable,Decodable{
    @DocumentID var id : String?
    let caption : String
    let timestamp : Timestamp
    let uid : String
    var likes : Int
    
    var user : User?
    var didLike : Bool? = false
}
    
