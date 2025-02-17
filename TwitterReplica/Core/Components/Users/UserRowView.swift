//
//  UserRowView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading,spacing: 4){
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundStyle(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
           
            
            Spacer()
            
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

//#Preview {
//    UserRowView(user: <#User#>)
//}
