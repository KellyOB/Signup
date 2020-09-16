//
//  FormScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @State var profile = Profile()
     
    var body: some View {
        VStack(spacing: 25.0) {
            
            // USERNAME
            HStack {
                Image(systemName: "person")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomTextField(placeholder: Text("Username").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.username)
            }
            .background(Capsule().fill(Color(UIColor.FORM_COLOR.start)))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
            
            // EMAIL
            HStack {
                Image(systemName: "envelope")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomTextField(placeholder: Text("Email").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.email)

                    if !profile.email.isEmpty {
                        if !profile.isEmailValid {
                            Text("Invalid email")
                            .foregroundColor(Color.red)
                            .padding(.trailing, 10)
                        }
                    }
            }
            .background(Capsule().fill(Color(UIColor.FORM_COLOR.start)))
            .overlay(profile.isEmailValid || profile.email.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))
      

            // PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomSecureTextField(placeholder: Text("Password").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.password)
                
                if !profile.password.isEmpty {
                    if !profile.isPasswordValid {
                        Text("Min. 6 characters")
                        .foregroundColor(Color.red)
                        .padding(.trailing, 10)
                    }
                }
            
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(profile.isPasswordValid || profile.password.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))
            
                        
            // CONFIRM PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomSecureTextField(placeholder: Text("Confirm Password").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.confirmPassword)
                
                if !profile.password.isEmpty {
                    if !profile.isConfirmPasswordValid {
                        Text("Does not match")
                        .foregroundColor(Color.red)
                        .padding(.trailing, 10)
                    }
                } 
                //.disabled(!isPasswordValid || profile.password.isEmpty)
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(profile.isConfirmPasswordValid || profile.confirmPassword.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.red, lineWidth: 1))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 15.0)
        .padding(.horizontal, 40)
        .font(.custom("Avenir", size: 16))
        .foregroundColor(.white)
        
    }
}

// CUSTOM TEXTFIELD
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
            .autocapitalization(.none)
        }
    }
}
// SECURE TEXT CUSTOM TEXTFIELD FOR PASSWORDS
struct CustomSecureTextField: View {
    var placeholder: Text
    @Binding var text: String
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
           SecureField("", text: $text, onCommit: commit)
            .autocapitalization(.none)
        }
    }
}


// TEXTFIELD COLOR
extension TextField {
    func textFieldModifier() -> some View {
        self
            .foregroundColor(.white)
    }
}

extension HStack {
    func overlayModifier() -> some View {
        self
         .overlay(RoundedRectangle(cornerRadius: 30)
         .stroke(Color.red, lineWidth: 1))
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
