//
//  ContentView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowMenu = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            MainTabView()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    isShowMenu.toggle()
                } label: {
                    Circle()
                        .frame(width: 35, height: 35)
                }

            }
        }
        
    }
}

#Preview {
    ContentView()
}
