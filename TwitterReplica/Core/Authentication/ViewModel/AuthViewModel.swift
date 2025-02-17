import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private let service = UserService()
    private var tempUserSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("DEBUG: Error is \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("DEBUG: Registration error - \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            self.tempUserSession = user
            
            let data = [
                "email": email,
                "username": username.lowercased(),
                "fullname": fullname,
                "uid": user.uid,
                "profileImageUrl": "",
                "createdAt": Timestamp()
            ]
            
            Task {
                do {
                    try await Firestore.firestore().collection("users")
                        .document(user.uid)
                        .setData(data)
                    
                    DispatchQueue.main.async {
                        self.didAuthenticateUser = true
                    }
                } catch {
                    print("DEBUG: Firestore error - \(error.localizedDescription)")
                }
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { [weak self] imageUrl in
            guard let self = self else { return }
            
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": imageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.tempUserSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
        
    }
}
