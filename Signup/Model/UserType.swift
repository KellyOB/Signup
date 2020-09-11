//
//  UserType.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

enum UserType: String {
    case parent = "parent"
    case child = "child"
    case teacher = "teacher"
    
    var user: String {
        switch self {
        case .parent:
            return "parent"
        case .child:
            return "child"
        case .teacher:
            return "teacher"
        }
    }
}
