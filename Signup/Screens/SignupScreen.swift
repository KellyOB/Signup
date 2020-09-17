//
//  SignupScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/8/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct SignupScreen: View {
    
    @State private var profile = Profile()
    @State var selectedAvatar: String = "none"
    
    let avatars: [Avatar] = Avatar.loadAvatars()
    
//    enum UserType {
//        case parent, child, teacher
//    }
    
    var userSelectedAvatar = String() {
        didSet {
            userSelectedAvatar = selectedAvatar
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Sign up")
                    .fontWeight(.light)
                    .font(.custom("Avenir", size: 30))
                    .foregroundColor(selectedAvatar == "teacher" ? Color.black : Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40.0)
                
                Text("WHO YOU ARE?")
                    .fontWeight(.black)
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar))
                    .padding(.top, 35.0)
                    .padding(.bottom, 5.0)
                
                AvatarView(selectedAvatar: $selectedAvatar)
                
                FormView(selectedAvatar: $selectedAvatar)
                
                ButtonView(profile: profile, selectedAvatar: $selectedAvatar)
                
                HStack {
                    Text("Already have an account.")
                        .italic()
                        .foregroundColor(setSecondayColor(selectedAvatar: selectedAvatar))
                    Text("Login here")
                        .italic()
                        .foregroundColor(selectedAvatar == "child" ? Color.white : Color.orange)
                }
                .font(.custom("Avenir", size: 15))
                .padding(.top, 30)
            }
        }.background(setPrimaryColor(selectedAvatar: selectedAvatar).edgesIgnoringSafeArea(.all))
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
    
//    func changeUsercolors(user: Avatar) -> Color {
//        switch user {
//        case .parent:
//            return Color(red: 0.161, green: 0.184, blue: 0.278).edgesIgnoringSafeArea(.all) as! Color
//        default:
//            return Color(red: 0.461, green: 0.584, blue: 0.478).edgesIgnoringSafeArea(.all) as! Color
//        }
//    }
}

struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}
