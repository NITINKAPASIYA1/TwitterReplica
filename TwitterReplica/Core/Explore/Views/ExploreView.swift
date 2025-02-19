//
//  ExploreView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack{
            SearchBar(text:$viewModel.searchText)
                .padding()
            ScrollView{
                LazyVStack{
                    
                    ForEach(viewModel.searchableUsers , id:\.self){user in
                        NavigationLink{
                            ProfileView(user: user)
                        }label:{
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
