//
//  Group.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 26.10.2021.
//

import Foundation
import RealmSwift

class GroupModel: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var screenName: String?
    @objc dynamic var isClosed: Int = 0
    @objc dynamic var type: String?
    @objc dynamic var photo50: String?
    
    convenience init (item: [String: Any]) {
        self.init()
        self.id = item["id"] as! Int
        self.name = item["name"] as? String
        self.screenName = item["screen_name"] as? String
        self.isClosed = item["is_closed"] as! Int
        self.type = item["type"] as? String
        self.photo50 = item["photo_50"] as? String
    }
}
