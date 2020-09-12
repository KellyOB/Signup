//
//  AvatarScreen.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/9/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
    
    @Binding var selectedAvatar: String
    
    var body: some View {
        HStack(spacing: 30.0) {
            VStack {
                Image("parent")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "parent"
                    }.opacity(self.selectedAvatar == "parent" || self.selectedAvatar == "none" ? 1.0 : 0.5)
                
                Text("PARENT")
                    .modifier(AvatarTextStyle())
                    .foregroundColor(self.selectedAvatar != "parent" || self.selectedAvatar == "none" ? Color(red: 0.996, green: 0.878, blue: 0.635) : Color.green)
            }

            VStack {
                Image("child")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "child"
                    }.opacity(self.selectedAvatar == "child" || self.selectedAvatar == "none" ? 1.0 : 0.5)

                Text("CHILD")
                    .modifier(AvatarTextStyle())
                    .foregroundColor(self.selectedAvatar != "child" || self.selectedAvatar == "none" ? Color(red: 0.937, green: 0.6, blue: 0.212) : Color.red)
            }

            VStack {
                Image("teacher")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "teacher"
                    }.opacity(self.selectedAvatar == "teacher" || self.selectedAvatar == "none" ? 1.0 : 0.5)

                Text("TEACHER")
                    .modifier(AvatarTextStyle())
                    .foregroundColor(self.selectedAvatar != "teacher" || self.selectedAvatar == "none" ? Color(red: 0.753, green: 0.898, blue: 0.894) : Color.red)
            }
        }
    }
}

struct AvatarTextStyle: ViewModifier {
     let font = Font.custom("Avenir", size: 13).weight(.bold)
    
     func body(content: Content) -> some View {
        content
            .font(font)
            .padding(.top, -10.0)
    }
}

extension Image {
    func imageAvatarModifier() -> some View {
        self
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 85.0)
    }
}

//struct AvatarScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AvatarScreen()
//    }
//}
