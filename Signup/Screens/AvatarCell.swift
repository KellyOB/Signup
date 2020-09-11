//
//  AvatarCell.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/10/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct AvatarCell: View {
    
    @Binding var selectedAvatar: String
    var avatar: Avatar
    
    var body: some View {
        VStack {
            Image(avatar.image)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 85.0)
                //.overlay(avatar.type == self.selectedAvatar ? RoundedRectangle(cornerRadius: 50)
                    //.stroke(Color.white, lineWidth: 2) : RoundedRectangle(cornerRadius: 50)
                    //.stroke(Color.white, lineWidth: 0))
            
                .opacity(avatar.type == self.selectedAvatar ? 1.0 : 0.5)
                //.opacity(setAvatarTextColor(selectedAvatar: selectedAvatar))
               // .overlay(setAvatarHighlight(selectedAvatar: selectedAvatar))
            
            Text(avatar.type)
                .fontWeight(.bold)
                .font(.custom("Avenir", size: 13))
                //.foregroundColor(Color(UIColor.SCREEN_BG.teacher))
                .foregroundColor(avatar.type == "PARENT" ? Color.red : Color.gray)
                .foregroundColor(avatar.type == "CHILD" ? Color.blue : Color.gray)
                .foregroundColor(avatar.type == "TEACHER" ? Color.yellow : Color.gray)
            .foregroundColor(setAvatarTextColor(selectedAvatar: selectedAvatar))
//                .foregroundColor(Color(red: 0.996, green: 0.878, blue: 0.635))
                .padding(.top, -5.0)
        }
    //.myAvatarStyle()
        .onTapGesture {
                print("selected \(self.avatar.type)")
                self.selectedAvatar = self.avatar.type
            print(self.selectedAvatar)
        }
    }
    
    func setAvatarTextColor(selectedAvatar: String) -> Color {
        if selectedAvatar == "TEACHER" {
            return Color(UIColor.SCREEN_BG.child)
        } else if selectedAvatar == "CHILD" {
            return Color(UIColor.SCREEN_BG.parent)
        } else if selectedAvatar == "PARENT" {
            return Color(UIColor.SCREEN_BG.child)
        }
        return Color(UIColor.SCREEN_BG.teacher)
    }
    
    func setAvatarHighlight(selectedAvatar: String) -> some View {
        if selectedAvatar == "TEACHER" {
            return RoundedRectangle(cornerRadius: 50)
                .stroke(Color.white, lineWidth: 0)
        } else if selectedAvatar == "CHILD" {
            return RoundedRectangle(cornerRadius: 50)
            .stroke(Color.white, lineWidth: 1)
        } else if selectedAvatar == "PARENT" {
            return RoundedRectangle(cornerRadius: 50)
            .stroke(Color.white, lineWidth: 0)
        }
        return RoundedRectangle(cornerRadius: 50)
        .stroke(Color.white, lineWidth: 0)
    }
    
    func setAvatarOpacity(selectedAvatar: String) -> Double {
        if selectedAvatar != "TEACHER" {
            return 0.5
        } else if selectedAvatar != "CHILD" {
            return 0.5
        } else if selectedAvatar != "PARENT" {
            return 0.5
        }
        return 1.0
    }
    
    
//    .onTapGesture {
//            print("selected teacher")
//            //self.selectedUser = "teacher"
//            //.overlay(RoundedRectangle   (cornerRadius: 50)
//            //.stroke(Color.white, lineWidth: 1))
//    }
}

struct MyAvatarStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.font(.custom("Avenir", size: 33))
            .foregroundColor(Color(UIColor.SCREEN_BG.teacher))
            //.foregroundColor(Color(red: 0.996, green: 0.878, blue: 0.635))
        .overlay(RoundedRectangle(cornerRadius: 30)
        .stroke(Color.red, lineWidth: 1))
        
    }
}

extension View {
    func myAvatarStyle() -> some View {
        ModifiedContent(content: self, modifier: MyAvatarStyle())
    }
}


