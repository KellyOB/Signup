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
    @Binding var selectedAvatar: String
      
    var body: some View {
        VStack(spacing: 25.0) {
            
            // USERNAME
            HStack {
                Image(systemName: "person")
                    .padding()
                    .foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar))
                
                CustomTextField(placeholder: Text("Username").foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar)), text: $profile.username)
            }
            .background(Capsule().fill(setPrimaryColor(selectedAvatar: selectedAvatar)))
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(setSecondayColor(selectedAvatar: selectedAvatar), lineWidth: 1))
            
            // EMAIL
            HStack {
                Image(systemName: "envelope")
                    .padding()
                    .foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar))
                
                CustomTextField(placeholder: Text("Email").foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar)), text: $profile.email)

                    if !profile.email.isEmpty {
                        if !profile.isEmailValid {
                            Text("Invalid email")
                            .foregroundColor(Color.red)
                            .padding(.trailing, 10)
                        }
                    }
            }
            .background(Capsule().fill(setPrimaryColor(selectedAvatar: selectedAvatar)))
            .overlay(profile.isEmailValid || profile.email.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(setSecondayColor(selectedAvatar: selectedAvatar), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))

            // PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar))
                
                CustomSecureTextField(placeholder: Text("Password").foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar)), text: $profile.password)
                
                if !profile.password.isEmpty {
                    if !profile.isPasswordValid {
                        Text("Min. 6 characters")
                        .foregroundColor(Color.red)
                        .padding(.trailing, 10)
                    }
                }
            }
            .background(Capsule().fill(setPrimaryColor(selectedAvatar: selectedAvatar)))
            .overlay(profile.isPasswordValid || profile.password.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(setSecondayColor(selectedAvatar: selectedAvatar), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))
            
                        
            // CONFIRM PASSWORD
            HStack {
                Image(systemName: "lock")
                    .padding()
                    .foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar))
                
                CustomSecureTextField(placeholder: Text("Confirm Password").foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar)), text: $profile.confirmPassword)
                    .disabled(!profile.isPasswordValid || profile.password.isEmpty)
                
                    if !profile.isConfirmPasswordValid {
                        Text("Does not match")
                        .foregroundColor(Color.red)
                        .padding(.trailing, 10)
                    }
            }
            .background(Capsule().fill(setPrimaryColor(selectedAvatar: selectedAvatar)))
            .overlay(profile.isConfirmPasswordValid || profile.confirmPassword.isEmpty ? RoundedRectangle(cornerRadius: 30)
                .stroke(setSecondayColor(selectedAvatar: selectedAvatar), lineWidth: 1) : RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1))
            
            // BUTTON
            if self.isUserInformationValid() {
                
                Button(action: {
                    print("is enabled")
                }, label: {
                    Text("SIGN IN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                })
                .buttonModifier(isDisabled: false, start: Color(UIColor.BUTTON_COLOR.startColor), end: Color(UIColor.BUTTON_COLOR.endColor))
            } else {
                Button(action: {
                    print("should not print")
                }, label: {
                    Text("SIGN IN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                })
                .buttonModifier(isDisabled: true, start: Color.gray, end: Color.black)
            }
        }
        .padding(.top, 15.0)
        .padding(.horizontal, 40)
        .font(.custom("Avenir", size: 16))
        .foregroundColor(selectedAvatar == "teacher" ? Color.black : Color.white)        
    }
    
    private func isUserInformationValid() -> Bool {
        
        if selectedAvatar == "none" {
            return true
        }
        
        if profile.username.isEmpty {
            return false
        }
        
        if !profile.isEmailValid {
            return false
        }
        
        if !profile.isPasswordValid {
            return false
        }
        
        if !profile.isConfirmPasswordValid {
            return false
        }
        return true
    }
    
    func setPrimaryColor(selectedAvatar: String) -> Color {
        if selectedAvatar == "parent" {
            return Color(UIColor.PRIMARY.parent)
        } else if selectedAvatar == "child" {
            return Color(UIColor.PRIMARY.child)
        } else if selectedAvatar == "teacher" {
            return Color(UIColor.PRIMARY.teacher)
        }
        return Color(UIColor.PRIMARY.start)
    }
    
    func setSecondayColor(selectedAvatar: String) -> Color {
        if selectedAvatar == "parent" {
            return Color(UIColor.SECONDARY.parent)
        } else if selectedAvatar == "child" {
            return Color(UIColor.SECONDARY.child)
        } else if selectedAvatar == "teacher" {
            return Color(UIColor.SECONDARY.teacher)
        }
        return Color(UIColor.SECONDARY.start)
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
extension Button {
    func buttonModifier(isDisabled: Bool, start: Color, end: Color) -> some View {
        self
            .disabled(isDisabled)
            .padding(.all, 6.0)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [start, end]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30)
            .padding(.top, 45.0)
    }
}

//struct FormView_Previews: PreviewProvider {
//    @Binding static var selectedAvatar: Avatar
//    static var previews: some View {
//        FormView(selectedAvatar: $selectedAvatar)
//    }
//}
