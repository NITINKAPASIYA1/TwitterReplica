//
//  SideMenuView.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading,spacing: 4){
                    Text("Vanshika Bhati")
                        .font(.headline)
                    
                    Text("@bhati_singh")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                }
                
                UserStatsView()
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id:\.self) { item in
                if item == .profile{
                    NavigationLink{
                        ProfileView()
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

#Preview {
    SideMenuView()
}


