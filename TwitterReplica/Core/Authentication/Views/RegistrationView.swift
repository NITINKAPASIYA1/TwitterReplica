import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: ProfilePhotoSelectorView(),
                    isActive: $viewModel.didAuthenticateUser,
                    label: { EmptyView() }
                )
                
                AuthHeaderView(text: "Get Started", text2: "Create your Account")
                
                VStack(spacing: 50) {
                    CustomTextField(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomTextField(imageName: "person", placeholderText: "Username", text: $username)
                    CustomTextField(imageName: "envelope", placeholderText: "Full Name", text: $fullname)
                    CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                .padding(.bottom, 30)
                
                Button {
                    viewModel.registerUser(withEmail: email,
                                           password: password,
                                           fullname: fullname,
                                           username: username)
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
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                .foregroundColor(Color(.systemBlue))
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RegistrationView()
}
