//
//  CustomTextField.swift
//  TwitterReplica
//
//  Created by Nitin on 14/02/25.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if let isSecureField {
                    SecureField(placeholderText, text: $text)
                }else{
                    TextField(placeholderText, text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    CustomTextField(imageName: "envelope", placeholderText: "email", isSecureField: false, text: .constant(""))
}
