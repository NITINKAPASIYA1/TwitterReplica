//
//  ContentView.swift
//  TwitterReplica
//
//  Created by Nitin on 13/02/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var isShowMenu = false
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession == nil{
                LoginView()
            }
            else{
                mainInterfaceView
            }
        }
        
    }
}

#Preview {
    ContentView()
}


extension ContentView {
    
    var mainInterfaceView : some View {
        
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
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut){
                            isShowMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                }
                
            }
        }
        .onAppear{
            isShowMenu = false
        }
    }
}
