//
//  Profile.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/8/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

struct Profile {    
    var username = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    
    
    var isEmailValid: Bool {
        if email.count < 5 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    
//    var isEmailValid: Bool {
//        // assume email should never be longer than 100 characters
//        if email.count > 100 {
//            return false
//        }
//        // check email format using regex approach
//        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: email)
//    }
}
