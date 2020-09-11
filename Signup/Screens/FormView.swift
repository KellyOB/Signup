//
//  FormScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @State private var profile = Profile()
    
    var body: some View {
        VStack(spacing: 25.0) {
            // USERNAME
            HStack {
                Image(systemName: "person")
                    .padding()
                    .foregroundColor(.secondary)
                
                TextField("Username",
                          text: $profile.username)
            }                      .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
                .overlay(RoundedRectangle   (cornerRadius: 30, style: .continuous)
                    .stroke(Color.white, lineWidth: 1))
                
                .frame(maxWidth: .infinity)
            
            // EMAIL
            HStack {
                Image(systemName: "envelope")
                    .padding()
                    .foregroundColor(.secondary)
                
                TextField("Email",
                          text: $profile.email)
            }
            .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
            .overlay(RoundedRectangle   (cornerRadius: 30)
            .stroke(Color.white, lineWidth: 1))
            
            // PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(.secondary)
                TextField("Password",
                          text: $profile.password)
            }
            .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
            .overlay(RoundedRectangle   (cornerRadius: 30)
            .stroke(Color.white, lineWidth: 1))
            
            // CONFIRM PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(.secondary)
                TextField("Confirm Password",
                          text: $profile.confirmPassword)
            }
            .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
            .overlay(RoundedRectangle   (cornerRadius: 30)
            .stroke(Color.white, lineWidth: 1))
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 15.0)
        .padding(.horizontal, 40)
        .textFieldStyle(SignupTextField())
    }
}

//struct FormScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        FormScreen()
//    }
//}
