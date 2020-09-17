//
//  ButtonView.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/11/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var profile: Profile
    
    @State var allFieldsValid = false
    @Binding var selectedAvatar: String
        
    var isSignupEnabled: Bool  {
        if !profile.username.isEmpty && profile.isEmailValid && profile.isPasswordValid && profile.isConfirmPasswordValid {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        Button(action: {
            
        }) {
            Text("SIGNUP")
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
            }.disabled(!allFieldsValid)
        .padding(.all, 6.0)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(isSignupEnabled || selectedAvatar == "none" ? LinearGradient(gradient: Gradient(colors: [Color(UIColor.BUTTON_COLOR.startColor), Color(UIColor.BUTTON_COLOR.endColor)]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(30)
        .padding(.top, 45.0)
        .padding(.horizontal, 40)
        .disabled(!isSignupEnabled)
    }

}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}
