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
            
            // PARENT AVATAR
            VStack {
                Image("parent")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "parent"
                    }
                
                Text("PARENT")
                    .textAvatarModifier(color: Color(UIColor.SECONDARY.parent))
            }.opacityModifier(selectedAvatar: selectedAvatar, avatar: "parent", start: "none")

            // CHILD AVATAR
            VStack {
                Image("child")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "child"
                    }

                Text("CHILD")
                    .textAvatarModifier(color: Color(UIColor.SECONDARY.child))
            }.opacityModifier(selectedAvatar: selectedAvatar, avatar: "child", start: "none")

            // TEACHER AVATAR
            VStack {
                Image("teacher")
                    .imageAvatarModifier()
                    .onTapGesture {
                        self.selectedAvatar = "teacher"
                    }

                Text("TEACHER")
                    .textAvatarModifier(color: Color(UIColor.SECONDARY.teacher))
                
            }.opacityModifier(selectedAvatar: selectedAvatar, avatar: "teacher", start: "none")
        }
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

extension Text {
    func textAvatarModifier(color: Color) -> some View {
        self
            .font(Font.custom("Avenir", size: 13).weight(.bold))
            .padding(.top, -10.0)
            .foregroundColor(color)
    }
}

extension VStack {
    func opacityModifier(selectedAvatar: String, avatar: String, start: String) -> some View {
        self
         .opacity(selectedAvatar == avatar || selectedAvatar == start ? 1.0 : 0.5)
    }
}

//struct AvatarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvatarView()
//    }
//}
