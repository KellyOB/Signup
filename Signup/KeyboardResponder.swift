//
//  KeyboardResponder.swift
//  Signup
//
//  Created by Kelly O'Brien on 9/14/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import Foundation
import SwiftUI

class KeyboardResponder: ObservableObject {
    
    @Published var currentHeight: CGFloat = 0
    
    var _center: NotificationCenter
        init(center : NotificationCenter = .default) {
            _center = center
            _center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            _center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    @objc func keyboardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                withAnimation {
                   currentHeight = keyboardSize.height
                }
            }
        }
    
    @objc func keyboardWillHide(notification: Notification) {
            withAnimation {
               currentHeight = 0
            }
        }
}
