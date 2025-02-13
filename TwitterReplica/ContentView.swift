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
                .navigationBarHidden(isShowMenu)
                
            
            if isShowMenu {
                ZStack{
                    Color.black.opacity(isShowMenu ? 0.25 : 0)
                }
                .onTapGesture {
                    withAnimation (.easeInOut){
                        isShowMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: isShowMenu ? 0 : -300, y: 0)
                .background(isShowMenu ? Color.white : Color.clear)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    withAnimation(.easeInOut){
                        isShowMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 35, height: 35)
                }

            }
        }
        .onAppear{
            isShowMenu = false
        }
    }
}

#Preview {
    ContentView()
}
