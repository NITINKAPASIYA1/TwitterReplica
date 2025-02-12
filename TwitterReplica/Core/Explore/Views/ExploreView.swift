//
//  ExploreView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0..<20,id:\.self){_ in
                            NavigationLink{
                                ProfileView()
                            }label:{
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
