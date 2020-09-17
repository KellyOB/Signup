//
//  ButtonView.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/11/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @State var profile = Profile()
    @Binding var selectedAvatar: String
    @State private var buttonDisabled = true
//    var isSignupEnabled: Bool  {
//        if !profile.username.isEmpty && profile.isEmailValid && profile.isPasswordValid && profile.isConfirmPasswordValid {
//            return true
//        } else {
//            return false
//        }
//    }
    
//    var buttonDisabled = Bool() {
//        didSet {
//            buttonDisabled = isSignupEnabled
//        }
//    }
    
    var body: some View {
        Button(action: {
            self.buttonDisabled = false
        }) {
            Text("SIGNUP")
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
            
        .padding(.all, 6.0)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(styleButton())
        //.background(!profile.username.isEmpty && profile.isEmailValid && profile.isPasswordValid && profile.isConfirmPasswordValid || selectedAvatar == "none" ? LinearGradient(gradient: Gradient(colors: [Color(UIColor.BUTTON_COLOR.startColor), Color(UIColor.BUTTON_COLOR.endColor)]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(30)
        .padding(.top, 45.0)
        .padding(.horizontal, 40)
        //.disabled(buttonDisabled)
    }
    
    func styleButton() -> Color {
        if !profile.username.isEmpty && profile.isEmailValid && profile.isPasswordValid && profile.isConfirmPasswordValid || selectedAvatar == "none" {
            return Color.green
        }
        return Color.blue
    }
    
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}
