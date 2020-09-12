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
                .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomTextField(placeholder: Text("Username").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.username)
            }
            .background(Capsule().fill(Color(UIColor.FORM_COLOR.start)))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
            //.frame(maxWidth: .infinity)
            
            // EMAIL
            HStack {
                Image(systemName: "envelope")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomTextField(placeholder: Text("Email").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.email)
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
            
            // PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
               CustomSecureField(placeholder: Text("Password").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.password)
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(RoundedRectangle   (cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
            
            // CONFIRM PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomSecureField(placeholder: Text("Confirm Password").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.confirmPassword)
            }
            .background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
            .overlay(RoundedRectangle   (cornerRadius: 30)
                .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 15.0)
        .padding(.horizontal, 40)
        .textFieldStyle(SignupTextField())
    }
}

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

struct CustomSecureField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
           SecureField("", text: $text)
        }
    }
}

extension TextField {
    func textFieldModifier() -> some View {
        self
         .foregroundColor(.white)
    }
}

//struct FormScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        FormScreen()
//    }
//}
