//
//  UserService.swift
//  TwitterReplica
//
//  Created by Nitin on 18/02/25.
//

import Firebase
import FirebaseFirestore

struct UserService {
    
    func fetchUser(withUid uid : String,completion: @escaping (User) -> Void){
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument { snapshot, _  in
                guard let snapshot = snapshot else { return }

                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
        }
    }
}
