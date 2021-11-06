//
//  User.swift
//  User
//
//  Created by Anastasiia Zubova on 16.09.2021.
//

import Foundation
import RealmSwift



class FriendsModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var photo100: String?
    
    var fullName: String {
        (firstName ?? "") + (" ") + (lastName ?? "")
    }
    
    convenience init (item: [String: Any]) {
        self.init()
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as? String
        self.lastName = item["last_name"] as? String
        self.photo100 = item["photo_100"] as? String
    }
}
