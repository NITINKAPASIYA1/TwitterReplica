//
//  User.swift
//  TwitterReplica
//
//  Created by Nitin on 18/02/25.
//

import FirebaseFirestore
import FirebaseAuth

struct User : Identifiable,Decodable,Hashable{
    @DocumentID var id : String?
    let username : String
    let fullname : String
    let profileImageUrl : String
    let email : String
    
    var isCurrentUser : Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
    
