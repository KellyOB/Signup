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
                    .foregroundColor(Color(UIColor.SECONDARY.parent))
                    .opacity(self.selectedAvatar == "parent" || self.selectedAvatar == "none" ? 1.0 : 0.5)
            }

            VStack {
                Image("child")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "child"
                    }.opacity(self.selectedAvatar == "child" || self.selectedAvatar == "none" ? 1.0 : 0.5)

                Text("CHILD")
                    .modifier(AvatarTextStyle())
                    .foregroundColor(self.selectedAvatar != "child" || self.selectedAvatar == "none" ? Color(UIColor.PRIMARY.child) : Color(UIColor.SECONDARY.child))
                    .opacity(self.selectedAvatar == "child" || self.selectedAvatar == "none" ? 1.0 : 0.5)
            }

            VStack {
                Image("teacher")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "teacher"
                    }.opacity(self.selectedAvatar == "teacher" || self.selectedAvatar == "none" ? 1.0 : 0.5)

                Text("TEACHER")
                    .modifier(AvatarTextStyle())
                    .foregroundColor(Color(UIColor.SECONDARY.teacher))
                    .opacity(self.selectedAvatar == "teacher" || self.selectedAvatar == "none" ? 1.0 : 0.5)
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
