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
    private var tempUserSession : FirebaseAuth.User?
    
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
//        Auth.auth().createUser(withEmail: email, password: password) { Result, error in
//            if let error {
//                print("DEBUG: Error is \(error.localizedDescription)")
//                return
//            }
//            
//            guard let user = Result?.user else {return}
//            self.tempUserSession = user
//            
//            
//            let data = [
//                "email" : email,
//                "username": username.lowercased(),
//                "fullname": fullname,
//                "uid": user.uid
//            ]
//            
//            Firestore.firestore().collection("users")
//                .document(user.uid)
//                .setData(data){_ in
//                    self.didAuthenticateUser = true
//                }
//        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("DEBUG: Registration error - \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {
                return
            }
            
            self.tempUserSession = user
            
            let data = [
                "email": email,
                "username": username.lowercased(),
                "fullname": fullname,
                "uid": user.uid,
                "createdAt": Timestamp() // Add timestamp for when user was created
            ]
            
            // Use async/await pattern for better error handling
            Task {
                do {
                    try await Firestore.firestore().collection("users")
                        .document(user.uid)
                        .setData(data)
                    
                    // Update state on main thread
                    DispatchQueue.main.async {
                        self.didAuthenticateUser = true
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("DEBUG: Firestore error - \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func signOut(){
        //sign out user from the app
        userSession = nil
        //Sign out user from Firebase too
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image:UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image){ imageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": imageUrl]){_ in
                    self.userSession = self.tempUserSession
                }
        }
    }
}
