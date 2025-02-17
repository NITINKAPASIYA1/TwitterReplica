//
//  User.swift
//  TwitterReplica
//
//  Created by Nitin on 18/02/25.
//

import FirebaseFirestore

struct User : Identifiable,Decodable,Hashable{
    @DocumentID var id : String?
    let username : String
    let fullname : String
    let profileImageUrl : String
    let email : String
}
    
