//
//  UserType.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation

struct Avatar: Identifiable {
    var id: Int
    var image: String
    var type: String
   // var textColor: String
    //var backGroundColor: String
    
    
    static func loadAvatars() -> [Avatar] {
        return [
            Avatar(id: 1, image: "parent", type: "PARENT"),
            Avatar(id: 2, image: "child", type: "CHILD"),
            Avatar(id: 3, image: "teacher", type: "TEACHER")
        ]
    }
}



//enum UserType: String {
//    case parent = "parent"
//    case child = "child"
//    case teacher = "teacher"
//
//    var user: String {
//        switch self {
//        case .parent:
//            return "parent"
//        case .child:
//            return "child"
//        case .teacher:
//            return "teacher"
//        }
//    }
//}
