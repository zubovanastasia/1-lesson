//
//  User.swift
//  User
//
//  Created by Anastasiia Zubova on 16.09.2021.
//

import Foundation

struct Friends {
    var id: Int = 0
    var firstName: String?
    var lastName: String?
    var photo100: String?
    var fullName: String {
        (firstName ?? "") + (" ") + (lastName ?? "")
    }
    
    init (item: [String: Any]) {
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as? String
        self.lastName = item["last_name"] as? String
        self.photo100 = item["photo_100"] as? String
    }
}
