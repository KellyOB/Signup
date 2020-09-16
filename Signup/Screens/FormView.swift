//
//  FormScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
//    var validation = Validation()
    @State var profile = Profile()
    
    // EMAIL VALIDATION
    var isEmailValid: Bool {
        if profile.email.count < 5 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: profile.email)
    }
    
    // PASSWORD VALIDATION
    var isPasswordValid: Bool {
        if profile.password.count < 6 {
            return false
        }
        return true
    }
    
    // CONFIRM PASSWORD VALIDATION
    var isConfirmPasswordValid: Bool {
        if profile.password != profile.confirmPassword {
            return false
        }
        return true
    }
    
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
                        if !isEmailValid {
                            Text("Invalid email")
                            .foregroundColor(Color.red)
                            .padding(.trailing, 10)
                        }
                    }
            }
            .background(Capsule().fill(Color(UIColor.FORM_COLOR.start)))
            .overlay(self.isEmailValid || profile.email.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))
      

            // PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomTextField(placeholder: Text("Password").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.password)
                
                if !profile.password.isEmpty {
                    if !isPasswordValid {
                        Text("Min. 6 characters")
                        .foregroundColor(Color.red)
                        .padding(.trailing, 10)
                    }
                }
            
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(self.isPasswordValid || profile.password.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))
            
                        
            // CONFIRM PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomTextField(placeholder: Text("Confirm Password").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.confirmPassword)
                
                if !profile.password.isEmpty {
                    if !isConfirmPasswordValid {
                        Text("Does not match")
                        .foregroundColor(Color.red)
                        .padding(.trailing, 10)
                    }
                } 
                //.disabled(!isPasswordValid || profile.password.isEmpty)
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(self.isConfirmPasswordValid || profile.confirmPassword.isEmpty ? RoundedRectangle(cornerRadius: 30)
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
