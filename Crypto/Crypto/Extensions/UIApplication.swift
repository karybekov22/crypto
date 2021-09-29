//
//  UIApplication.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 24/9/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
