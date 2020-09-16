//
//  Validation.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/14/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

class Validation {

    var profile = Profile()
    
    func isPasswordValid() -> Bool {
        if profile.password.count < 6 {
            return false
        }
        return true
    }
    
//    func textFieldValidatorEmail(_ string: String) -> Bool {
//        if string.count > 100 {
//            return false
//        }
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: string)
//    }
    
    
   public func validateEmail(email: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let trimmedString = email.trimmingCharacters(in: .whitespaces)
      let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      let isValidateEmail = validateEmail.evaluate(with: trimmedString)
      return isValidateEmail
   }
   public func validatePassword(password: String) -> Bool {
      //Minimum 8 characters at least 1 Alphabet and 1 Number:
      let passRegEx = "[a-zA-Z0-9_.-]{8,}$"
      let trimmedString = password.trimmingCharacters(in: .whitespaces)
      let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
      let isvalidatePass = validatePassord.evaluate(with: trimmedString)
      return isvalidatePass
   }
    
    public func validateCVV(cvv: String) -> Bool {
       let cvvRegEx = "[0-9]{3}"
       let trimmedString = cvv.trimmingCharacters(in: .whitespaces)
       let validateCVV = NSPredicate(format:"SELF MATCHES %@", cvvRegEx)
       let isValidateCVV = validateCVV.evaluate(with: trimmedString)
       return isValidateCVV
    }
    
    public func validateCardHolder(cardHolder: String) -> Bool {
       let cardHolderRegEx = "[A-Za-z]+ [A-Za-z]+"
       let trimmedString = cardHolder.trimmingCharacters(in: .whitespaces)
       let validateCardHolder = NSPredicate(format:"SELF MATCHES %@", cardHolderRegEx)
       let isValidateCardHolder = validateCardHolder.evaluate(with: trimmedString)
       return isValidateCardHolder
    }
}
