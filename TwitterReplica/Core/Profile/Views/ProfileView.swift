//
//  ProfileView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import Kingfisher
import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .Tweets
    @Namespace  var animation
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel : ProfileViewModel
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButton
            
            userInfoDetails
            
            tweetBar
            
            
            tweetsView
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ProfileView(user: User(username: "hello", fullname: "hello", profileImageUrl: "hello", email: "email#gmail.com"))
}

extension ProfileView {
    
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }
                
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
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
    
    var userInfoDetails : some View {
        
        VStack(alignment: .leading,spacing: 4){
            HStack{
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
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
            
            
            UserStatsView()
            
        }
        .padding(.horizontal)
    }
    
    
    var tweetBar : some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases,id:\.rawValue){
                it in
                VStack{
                    Text(it.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == it ? .bold : .regular)
                        .foregroundStyle(selectedFilter == it ? .black : .gray)
                    
                    if selectedFilter == it {
                        Capsule()
                            .foregroundStyle(.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else {
                        Capsule()
                            .foregroundStyle(.clear)
                            .frame(height: 3)
                    }
                    
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = it
                    }
                }
            }
        }
        .overlay(Divider(),alignment: .bottom)
    }
    
    
    var tweetsView : some View {
        ScrollView {
            LazyVStack{
                ForEach(viewModel.tweets){ tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
