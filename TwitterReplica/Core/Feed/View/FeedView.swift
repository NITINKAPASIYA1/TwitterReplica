//
//  FeedView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0..<20, id:\.self){_ in
                    Text("Hello, World!")
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
