//
//  AvatarScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct AvatarList: View {
    
    @Binding var selectedUser: String
    //let users: [UserType]
    
    var body: some View {
        HStack(spacing: 30.0) {
            VStack {
                Image(UserType.parent.user)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 85.0)
                    
                    .onTapGesture {
                        print("selelcted parent")
                        
                        self.selectedUser = "parent"
                        
                }
                Text(UserType.parent.user.uppercased())
                    .fontWeight(.bold)
                    .font(.custom("Avenir", size: 13))
                    .foregroundColor(Color(red: 0.996, green: 0.878, blue: 0.635))
                    .padding(.top, -10.0)
            }
            
            VStack {
                Image("child")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 85.0)
                    .onTapGesture {
                        print("selected child")
                        self.selectedUser = "child"
                    }
                
                Text("CHILD")
                    .fontWeight(.bold)
                    .font(.custom("Avenir", size: 13))
                    .foregroundColor(Color(red: 0.937, green: 0.6, blue: 0.212))
                    .padding(.top, -10.0)
            }
            
            VStack {
                Image("teacher")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 85.0)
                    .onTapGesture {
                        print("selected teacher")
                        self.selectedUser = "teacher"
                        //.overlay(RoundedRectangle   (cornerRadius: 50)
                        //.stroke(Color.white, lineWidth: 1))
                }
                                
                Text("TEACHER")
                    .fontWeight(.bold)
                    .font(.custom("Avenir", size: 13))
                    .foregroundColor(Color(red: 0.753, green: 0.898, blue: 0.894))
                    .padding(.top, -10.0)
            }
        }
    }
}

//struct AvatarScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AvatarScreen()
//    }
//}
