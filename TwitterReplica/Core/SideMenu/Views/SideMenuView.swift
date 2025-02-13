//
//  SideMenuView.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI

struct SideMenuView: View {
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
                HStack(spacing: 16){
                    Image(systemName: item.imageName)
                        .font(.headline)
                        .foregroundStyle(.gray)
                    
                    Text(item.title)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .frame(height: 40)
                .padding(.horizontal)
            }
            .padding(.vertical)
            Spacer()
        }
       
    }
}

#Preview {
    SideMenuView()
}
