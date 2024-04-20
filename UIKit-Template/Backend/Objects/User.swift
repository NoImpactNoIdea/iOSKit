//
//  User.swift
//  UIKit-Template
//
//  Created by Steven Wright on 4/19/24.
//

import Foundation

class User: Codable {
    var name: String?
    
    init(name: String? = nil) {
        self.name = name
    }
}
