//
//  ProfilePhotoSelectorView.swift
//  TwitterReplica
//
//  Created by Nitin on 15/02/25.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            AuthHeaderView(text: "Setup Account", text2: "Add a Profile Photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage =  profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .scaledToFit()
                }
                else {
                    Image(systemName: "photo.badge.plus")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            .sheet(isPresented: $showImagePicker,onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)
            
            if let  selectedImage = selectedImage{
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfilePhotoSelectorView( )
}
