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
    @State var selectedUser = "parent"
    
//    enum UserType {
//        case parent, child, teacher
//    }
    
    var selectedUserType = String() {
        didSet {
           selectedUserType = selectedUser
            
        }
    }
    
    func loadParentStyles() {
        //
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
                    .foregroundColor(Color(red: 0.533, green: 0.58, blue: 0.776))
                    .padding(.top, 35.0)
                    .padding(.bottom, 5.0)
                
                AvatarList(selectedUser: $selectedUser)
                FormScreen()
//                VStack(spacing: 25.0) {
//                    // USERNAME
//                    HStack {
//                        Image(systemName: "person")
//                            .padding()
//                            .foregroundColor(.secondary)
//                        
//                        TextField("Username",
//                                  text: $profile.username)
//                    }                      .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
//                        .overlay(RoundedRectangle   (cornerRadius: 30, style: .continuous)
//                            .stroke(Color.white, lineWidth: 1))
//                        
//                        .frame(maxWidth: .infinity)
//                    
//                    // EMAIL
//                    HStack {
//                        Image(systemName: "envelope")
//                            .padding()
//                            .foregroundColor(.secondary)
//                        
//                        TextField("Email",
//                                  text: $profile.email)
//                    }
//                    .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
//                    .overlay(RoundedRectangle   (cornerRadius: 30)
//                    .stroke(Color.white, lineWidth: 1))
//                    
//                    // PASSWORD
//                    HStack {
//                        Image(systemName: "lock")
//                            .padding()
//                            .foregroundColor(.secondary)
//                        TextField("Password",
//                                  text: $profile.password)
//                    }
//                    .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
//                    .overlay(RoundedRectangle   (cornerRadius: 30)
//                    .stroke(Color.white, lineWidth: 1))
//                    
//                    // CONFIRM PASSWORD
//                    HStack {
//                        Image(systemName: "lock")
//                            .padding()
//                            .foregroundColor(.secondary)
//                        TextField("Confirm Password",
//                                  text: $profile.confirmPassword)
//                    }
//                    .background(Capsule().fill(Color(red: 117/255, green: 0.58, blue: 0.776)))
//                    .overlay(RoundedRectangle   (cornerRadius: 30)
//                    .stroke(Color.white, lineWidth: 1))
//                    
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.top, 15.0)
//                .padding(.horizontal, 40)
//                .textFieldStyle(SignupTextField())
                
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
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 238/255, green: 76/255, blue: 92/255), Color(red: 240/255, green: 125/255, blue: 56/255)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
                .padding(.top, 45.0)
                .padding(.horizontal, 40)
                
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
        }.background(Color(red: 0.161, green: 0.184, blue: 0.278).edgesIgnoringSafeArea(.all))
        
        // PARENT
        //.background(Color(red: 0.996, green: 0.878, blue: 0.635).edgesIgnoringSafeArea(.all))
        
        // CHILD
        //.background(Color(red: 0.937, green: 0.6, blue: 0.212).edgesIgnoringSafeArea(.all))
        
        // TEACHER
        //.background(Color(red: 0.753, green: 0.898, blue: 0.894).edgesIgnoringSafeArea(.all))
        
        
    }
    
    func changeUsercolors(user: UserType) -> Color {
        switch user {
        case .parent:
            return Color(red: 0.161, green: 0.184, blue: 0.278).edgesIgnoringSafeArea(.all) as! Color
        default:
            return Color(red: 0.461, green: 0.584, blue: 0.478).edgesIgnoringSafeArea(.all) as! Color
        }
    }
}

struct SignupScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
    }
}


//.padding(10.0)
//.background(Color(red: 0.161, green: 0.184, blue: 0.278))
//.cornerRadius(30)
// .foregroundColor(.black)//text color when you type
//.accentColor(.blue)//cursor color
//.overlay(RoundedRectangle(cornerRadius: 30).stroke((Color(red: 85/255, green: 91/255, blue: 115/255)), lineWidth: 2))

// Blue color
//.foregroundColor(Color(red: 41.0, green: 47.0, blue: 71.0, opacity: 1.0))



//.background(SwiftUI.Color.yellow.edgesIgnoringSafeArea(.all))
// Form {
//                HStack {
//                Image(systemName: "person").foregroundColor(.gray)
//                    TextField("Enter your firstName", text: $profile.firstName)
////                    onEditingChanged: { _ in print("changed") },
////                    onCommit: { print("commit") }
//                Image(systemName:"exclamationmark.triangle.fill").foregroundColor(Color.red)
//
//                }
//                ZStack {
//                Image(systemName: "person").foregroundColor(.gray)
//                    .offset(x: -165, y: 0)
//                TextField("     Username", text: $profile.username)
//                    //.padding(.leading, 30)
////                Image(systemName:"exclamationmark.triangle.fill").foregroundColor(Color.red)
//                }


//                TextField("Username", text: $profile.username)
//                    .background(SwiftUI.Color.red)
//                    // changes input text color
//                    //.foregroundColor(.red)
//                    .background(RoundedRectangle(cornerRadius: 30))
//.overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.blue, lineWidth: 3))
//.textFieldStyle(RoundedBorderTextFieldStyle())

//                TextField("Email", text: $profile.email)
//                    .textContentType(.emailAddress)
//                .padding(.all)
//                //.background(textFieldBackground)
//
//
//                TextField("Password", text: $profile.password)
//
//                TextField("Confirm Password", text: $profile.confirmPassword)
// }//.background(Color.black)

//            .onAppear {
//               UITableView.appearance().backgroundColor = UIColor(red:41/255, green:47/255, blue:71/255, alpha:1.0)
//            }
//.textFieldStyle(SignupTextField())
