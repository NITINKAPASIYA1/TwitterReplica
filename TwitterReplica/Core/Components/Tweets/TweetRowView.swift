//
//  TweetsRowView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundStyle(Color(.systemBlue))
                
                VStack(alignment: .leading,spacing: 4){
                    HStack{
                        Text("Nitin Dude")
                            .font(.subheadline).bold()
                        Text("@batsman")
                            .foregroundStyle(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    
                    Text("I believe in harvy dent")
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

#Preview {
    TweetRowView()
}
