//
//  String.swift
//  Crypto
//
//  Created by Nursultan Karybekov on 23/9/21.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
