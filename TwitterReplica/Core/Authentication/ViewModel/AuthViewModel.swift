//
//  AuthViewModel.swift
//  TwitterReplica
//
//  Created by Nitin on 15/02/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email:String,password:String){
        Auth.auth().signIn(withEmail: email, password: password){ Result, error in
            if let error {
                print("DEBUG: Error is \(error.localizedDescription)")
                return
            }
            
            
            guard let user = Result?.user else {return}
            self.userSession = user
            
            print("DEBUG: Successfully Login user")
        }
    }
    
    func registerUser(withEmail email:String,password:String,fullname:String,username:String){
        Auth.auth().createUser(withEmail: email, password: password) { Result, error in
            if let error {
                print("DEBUG: Error is \(error.localizedDescription)")
                return
            }
            
            guard let user = Result?.user else {return}
            
            print("DEBUG: Successfully registered user")
            print("User is \(self.userSession)")
            
            let data = [
                "email" : email,
                "username": username.lowercased(),
                "fullname": fullname,
                "uid": user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){_ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut(){
        //sign out user from the app
        userSession = nil
        //Sign out user from Firebase too
        try? Auth.auth().signOut()
    }
}
