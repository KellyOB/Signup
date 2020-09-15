//
//  SignupScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/8/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct SignupTextField: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.custom("Avenir", size: 18))
            .foregroundColor(.white)
    }
}

struct SignupScreen: View {
    
    @State private var profile = Profile()
    @State var selectedAvatar = "none"
    
    let avatars = Avatar.loadAvatars()
    
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
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40.0)
                
                Text("WHO YOU ARE?")
                    .fontWeight(.black)
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(Color(UIColor.FORM_COLOR.formOutline))
                    .padding(.top, 35.0)
                    .padding(.bottom, 5.0)
                
                AvatarView(selectedAvatar: $selectedAvatar)
                
                FormView()
                
                ButtonView(selectedAvatar: $selectedAvatar)
                
                HStack {
                    Text("Already have an account.")
                        .italic()
                        .foregroundColor(Color.white)
                    Text("Login here")
                        .italic()
                        .foregroundColor(Color.orange)
                }
                .font(.custom("Avenir", size: 15))
                .padding(.top, 30)
            }
        }.background(setBGColor(selectedAvatar: selectedAvatar).edgesIgnoringSafeArea(.all))
    }
    
    func setBGColor(selectedAvatar: String) -> Color {
        if selectedAvatar == "teacher" {
            return Color.red
            //return Color(UIColor.SCREEN_BG.teacher)
        } else if selectedAvatar == "child" {
            return Color(UIColor.SCREEN_BG.child)
        } else if selectedAvatar == "parent" {
            //return Color.green
            return Color(UIColor.SCREEN_BG.parent)
        }
        return Color(UIColor.SCREEN_BG.start)
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
