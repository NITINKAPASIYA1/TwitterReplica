//
//  AuthHeaderView.swift
//  TwitterReplica
//
//  Created by Nitin on 17/02/25.
//

import SwiftUI

struct AuthHeaderView: View {
    var text : String
    var text2: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(text2)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundStyle(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    AuthHeaderView(text: "hello", text2: "Not")
}
