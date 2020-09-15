//
//  FormScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    var validation = Validation()
    
    @State var profile = Profile()
    
    var isEmailValid: Bool {
        if profile.email.count < 5 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: profile.email)
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
            //.frame(maxWidth: .infinity)

            
            // EMAIL
            HStack {
                Image(systemName: "envelope")
                    .padding()
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                
                CustomEmailTextField(placeholder: Text("Email").foregroundColor(Color(UIColor.FORM_COLOR.formOutline)), text: $profile.email)

                    .foregroundColor(profile.isEmailValid ? Color.red : Color.yellow)
                
                    if !profile.email.isEmpty {
                        if !isEmailValid {
                            Text("Invalid email")
                            .foregroundColor(Color.red)
                            .padding(.trailing, 10)
                        }
                    }
            }
           .background(Capsule().fill(Color(UIColor.FORM_COLOR.start)))
            //.background(Capsule().fill(Color(red: 0.161, green: 0.184, blue: 0.278)))
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
            //.stroke(.isEmailValid ? Color.init(Color.yellow) : Color.red, lineWidth: 4)
//.stroke(profile.isEmailValid ? Color.init("titleColor") : profile.isEmailBlank ? Color.init("titleColor") : Color.red, lineWidth: 4)
      
            
            

            
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
            .overlay(RoundedRectangle(cornerRadius: 30)
            .stroke(Color(UIColor.FORM_COLOR.formOutline), lineWidth: 1))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 15.0)
        .padding(.horizontal, 40)
        .textFieldStyle(SignupTextField())
    }
    
    
    
    
    
    
    // EMAIL VALIDATION
//    var isEmailValid: Bool {
//        // assume email should never be longer than 50 characters
//        if profile.email.count > 50 {
//            return false
//        }
//        // check email format using regex approach
//        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: profile.email)
//    }
//
//    func textFieldValidatorEmail(_ string: String) -> Bool {
//        if string.count > 100 {
//            return false
//        }
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: string)
//    }
    
//    func validateEmail(email: String) -> Bool {
//       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//       let trimmedString = email.trimmingCharacters(in: .whitespaces)
//       let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//       let isValidateEmail = validateEmail.evaluate(with: trimmedString)
//       return isValidateEmail
//    }
    
    
    
    
//    func isEmailValid() -> Bool {
//        let email = emailTextField //else { return false }
//        //paypalEmailValidationLabel.isHidden = true
//        let isValidateEmail = self.validateEmail(email: email)
//
//        if !isValidateEmail {
////            paypalEmailValidationLabel.isHidden = false
////            paypalEmailValidationLabel.text = "Invalid email address"
////            paypalEmailTextField.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.231372549, blue: 0.1882352941, alpha: 1)
////            paypalEmailTextField.layer.borderWidth = 1.0
//            return false
//        }
//        //paypalEmailTextField.layer.borderWidth = 0.0
//        return true
//    }
    // PASSWORD VALIDATION
//    func isPasswordValid() -> Bool {
//        let password = passwordTextField // else { return false }
//        //paypalPasswordValidationLabel.isHidden = true
//        let isValidatePass = self.validation.validatePassword(password: password)
//
//        if !isValidatePass {
//
////            paypalPasswordTextField.layer.borderColor = #colorLiteral(red: 0.9058823529, green: 0.231372549, blue: 0.1882352941, alpha: 1)
////            paypalPasswordTextField.layer.borderWidth = 1.0
////            paypalPasswordValidationLabel.text = "Must be at least 8 characters"
////            paypalPasswordValidationLabel.isHidden = false
//            return false
//        }
//        //paypalPasswordTextField.layer.borderWidth = 0.0
//        return true
//    }
}




// USERNAME TEXTFIELD PLACEHOLDER
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { print("commited") }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

// EMAIL FIELD
struct CustomEmailTextField: View {
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

// PASSWORD FIELD
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

//struct FormScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        FormScreen()
//    }
//}
