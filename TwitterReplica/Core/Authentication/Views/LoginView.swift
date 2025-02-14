//
//  LoginView.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            
            VStack(alignment: .leading){
                HStack{Spacer()}
                
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundStyle(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            
            VStack(spacing: 40){
                
                CustomTextField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomTextField(imageName: "lock", placeholderText: "Password", text: $password)
                
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            
            HStack{
                Spacer()
                
                NavigationLink{
                    Text("Reset password view...")
                }label: {
                    Text("Forget Password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            }label: {
                HStack{
                    Text("Dont't have an account")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
