//
//  FeedView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0..<20, id:\.self){_ in
                        TweetRowView()
                            .padding()
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(.tweet)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding()
                    .padding(.bottom,40)
            }
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
            

        }
    }
}

#Preview {
    FeedView()
}
