//
//  SideMenuView.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading,spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text(user.username)
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                    }
                    
                    UserStatsView()
                }
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id:\.self) { item in
                    if item == .profile{
                        NavigationLink{
                            ProfileView(user: user)
                        }label:{
                            SideMenuOptionRowView(viewModel: item)
                        }
                    }
                    else if item == .logout {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: item)
                        }
                        
                    }
                    else {
                        SideMenuOptionRowView(viewModel: item)
                    }
                }
                .padding(.vertical)
                Spacer()
            }
        }
       
    }
}


