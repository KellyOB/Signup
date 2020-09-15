//
//  AvatarCell.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/10/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//


import SwiftUI

struct AvatarCell: View {
    @State var output: String = ""
    @State var input: String = ""
    @State var typing = false
    @State var allFieldsValid = false
       //@Binding var selectedAvatar: String
    @State private var isEmailValid : Bool = true
    

    
    var body: some View {
        VStack {
            
            TextField("", text: $input,
               onCommit: {
                self.output = self.input
            })

            if !typing {
                if !output.isEmpty {
                    if !textFieldValidatorEmail(input) {
                        Text("Please enter valid email address.")
                        .foregroundColor(Color.red)
                    }
                }
            }     
        }
        
        
//        Button(action: {
//
//        }) {
//            Text("SIGNUP")
//                .font(.headline)
//                .foregroundColor(.white)
//                .fontWeight(.bold)
//            }.disabled(!allFieldsValid)
//        .padding(.all, 6.0)
//        .frame(height: 50)
//        .frame(maxWidth: .infinity)
//            .background(!allFieldsValid ? LinearGradient(gradient: Gradient(colors: [Color(UIColor.BUTTON_COLOR.startColor), Color(UIColor.BUTTON_COLOR.endColor)]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .leading, endPoint: .trailing))
//        .cornerRadius(30)
//        .padding(.top, 45.0)
//        .padding(.horizontal, 40)
    }
    
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct AvatarCellPreview: PreviewProvider {
    static var previews: some View {
        AvatarCell()
    }
}

















//import SwiftUI

//struct AvatarCell: View {
    
//    @Binding var selectedAvatar: String
//    var avatar: Avatar
//
//    var body: some View {
//        VStack {
//            Image(avatar.image)
//                .resizable()
//                .aspectRatio(1, contentMode: .fit)
//                .frame(width: 85.0)
//                //.overlay(avatar.type == self.selectedAvatar ? RoundedRectangle(cornerRadius: 50)
//                    //.stroke(Color.white, lineWidth: 2) : RoundedRectangle(cornerRadius: 50)
//                    //.stroke(Color.white, lineWidth: 0))
//
//               // .opacity(avatar.type == self.selectedAvatar ? 1.0 : 0.5)
//                .opacity(setAvatarOpacity(selectedAvatar: selectedAvatar))
//                //.opacity(setAvatarTextColor(selectedAvatar: selectedAvatar))
//               .overlay(setAvatarHighlight(selectedAvatar: selectedAvatar))
//
//            Text(avatar.type)
//                .fontWeight(.bold)
//                .font(.custom("Avenir", size: 13))
//                //.foregroundColor(Color(UIColor.SCREEN_BG.teacher))
//                .foregroundColor(avatar.type == "parent" ? Color.red : Color.gray)
//                .foregroundColor(avatar.type == "child" ? Color.blue : Color.gray)
//                .foregroundColor(avatar.type == "teacher" ? Color.yellow : Color.gray)
//            .foregroundColor(setAvatarTextColor(selectedAvatar: selectedAvatar))
////                .foregroundColor(Color(red: 0.996, green: 0.878, blue: 0.635))
//                .padding(.top, -5.0)
//        }
//    //.myAvatarStyle()
//        .onTapGesture {
//                print("selected \(self.avatar.type)")
//                self.selectedAvatar = self.avatar.type
//            print(self.selectedAvatar)
//        }
//    }
//
//    enum AvatarType {
//        case none, parent, child, teacher
//    }
//
//    func setAvatarTextColor(selectedAvatar: String) -> Color {
//        if selectedAvatar == "teacher" {
//            return Color(UIColor.SCREEN_BG.child)
//        } else if selectedAvatar == "child" {
//            return Color(UIColor.SCREEN_BG.parent)
//        } else if selectedAvatar == "parent" {
//            return Color(UIColor.SCREEN_BG.child)
//        }
//        return Color(UIColor.SCREEN_BG.teacher)
//    }
//
//    func setAvatarHighlight(selectedAvatar: String) -> some View {
//        if selectedAvatar != "teacher" {
//            return RoundedRectangle(cornerRadius: 50)
//                .stroke(Color.white, lineWidth: 0)
//        } else if selectedAvatar != "child" {
//            return RoundedRectangle(cornerRadius: 50)
//            .stroke(Color.white, lineWidth: 0)
//        } else if selectedAvatar != "parent" {
//            return RoundedRectangle(cornerRadius: 50)
//            .stroke(Color.white, lineWidth: 0)
//        } else if selectedAvatar == "none" {
//            return RoundedRectangle(cornerRadius: 50)
//            .stroke(Color.white, lineWidth: 2)
//        }
//        return RoundedRectangle(cornerRadius: 50)
//        .stroke(Color.white, lineWidth: 2)
//    }
//
//    func setAvatarOpacity(selectedAvatar: String) -> Double {
//        if selectedAvatar == "none" && selectedAvatar != "teacher" && selectedAvatar != "child" && selectedAvatar != "parent" {
//            return 1.0
//        } else if selectedAvatar != "none" && selectedAvatar != "teacher" {
//            return 0.5
//        } else if selectedAvatar != "none" && selectedAvatar != "child" {
//            return 0.5
//        } else if selectedAvatar != "none" && selectedAvatar != "parent" {
//            return 0.5
//        }
//
//        return 1.0
//    }
//
//
////    .onTapGesture {
////            print("selected teacher")
////            //self.selectedUser = "teacher"
////            //.overlay(RoundedRectangle   (cornerRadius: 50)
////            //.stroke(Color.white, lineWidth: 1))
////    }
//}
//
//struct MyAvatarStyle: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            //.font(.custom("Avenir", size: 33))
//            .foregroundColor(Color(UIColor.SCREEN_BG.teacher))
//            //.foregroundColor(Color(red: 0.996, green: 0.878, blue: 0.635))
//        .overlay(RoundedRectangle(cornerRadius: 30)
//        .stroke(Color.red, lineWidth: 1))
//
//    }
//}
//
//extension View {
//    func myAvatarStyle() -> some View {
//        ModifiedContent(content: self, modifier: MyAvatarStyle())
//    }
//}
//
//
