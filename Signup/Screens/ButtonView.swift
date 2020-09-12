//
//  ButtonView.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/11/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {
            // add action
        }) {
            Text("SIGNUP")
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding(.all, 6.0)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.BUTTON_COLOR.startColor), Color(UIColor.BUTTON_COLOR.endColor)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(30)
        .padding(.top, 45.0)
        .padding(.horizontal, 40)
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}