//
//  SearchBar.swift
//  TwitterReplica
//
//  Created by Nitin on 20/02/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack{
            TextField("Search", text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,8)
                        
                    }
                }
        }
        .padding(.horizontal,4)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
