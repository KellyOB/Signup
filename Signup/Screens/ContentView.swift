//
//  ContentView.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/8/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var keyboardResonder = KeyboardResponder()
    @State private var profile = Profile()
    @State var selectedAvatar: String = "none"
    
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
        .offset(y: -keyboardResonder.currentHeight*0.9)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
