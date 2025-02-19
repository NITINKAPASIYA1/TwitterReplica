//
//  TweetsRowView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    let tweet : Tweet
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                KFImage(URL(string: tweet.user?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment: .leading,spacing: 4){
                    if let user = tweet.user{
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.fullname)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                    
                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            HStack{
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
                
            }
            .padding()
            .foregroundStyle(.gray)
            Divider()
        }
       
       
    }
}

//#Preview {
//    TweetRowView()
//}
