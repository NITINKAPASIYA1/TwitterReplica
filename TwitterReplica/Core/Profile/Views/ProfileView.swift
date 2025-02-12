//
//  ProfileView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButton
            
            VStack(alignment: .leading,spacing: 4){
                HStack{
                    Text("Vanshika Bhati")
                        .font(.title2).bold()
                    
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(Color(.systemBlue))
                }
                
                Text("@bhati.vanshika")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                Text("Your bio goes here")
                    .font(.subheadline)
                    .padding(.vertical)
                
                HStack(spacing: 24){
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        
                        Text("Gotham/ Metropolis")
                           
                            
                    }
                    
                    HStack{
                        Image(systemName: "link")
                        
                        Text("www.vanshika.com")
                            
                        
                    }
                }
                .foregroundStyle(.gray)
                .font(.caption)
            }
            .padding(.horizontal)
            
            
            Spacer()
            
        }
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButton : some View {
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay{Circle().stroke(Color.gray,lineWidth: 0.75)}
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundStyle(.black)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray,lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
}
