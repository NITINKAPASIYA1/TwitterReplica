//
//  UserStatsView.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("21")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            HStack(spacing: 4){
                Text("42")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.vertical)
        
    }
}

#Preview {
    UserStatsView()
}
