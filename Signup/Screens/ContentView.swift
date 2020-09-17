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
    
    var body: some View {
        SignupScreen()
        .offset(y: -keyboardResonder.currentHeight*0.9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
