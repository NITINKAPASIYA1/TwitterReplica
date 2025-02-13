//
//  LoginView.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack{
            
            
            VStack(alignment: .leading){
                HStack{Spacer()}
                
                Text("Get Started")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Create your Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundStyle(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            
            VStack(spacing: 50){
                
                CustomTextField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomTextField(imageName: "person", placeholderText: "Username", text: $username)
                
                CustomTextField(imageName: "envelope", placeholderText: "Full Name", text: $fullname)
                
                CustomTextField(imageName: "lock", placeholderText: "password", text: $password)
                
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            .padding(.bottom,30)
            
        
            
            Button {
                print("sign in here")
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
            }label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
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
    RegistrationView()
}
