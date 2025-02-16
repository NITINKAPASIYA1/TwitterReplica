//
//  ProfilePhotoSelectorView.swift
//  TwitterReplica
//
//  Created by Nitin on 15/02/25.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack{
            AuthHeaderView(text: "Setup Account", text2: "Add a Profile Photo")
            
            Button {
                print("Pick Image here")
            } label: {
                Image(systemName: "photo.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top,44)
            }
            
            Spacer()

            
            
        
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
