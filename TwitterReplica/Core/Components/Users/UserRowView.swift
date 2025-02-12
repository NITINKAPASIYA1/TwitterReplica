//
//  UserRowView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading,spacing: 4){
                Text("Vanshika Bhati")
                    .font(.subheadline).bold()
                    .foregroundStyle(.black)
                
                Text("bhati singh")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
           
            
            Spacer()
            
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

#Preview {
    UserRowView()
}
