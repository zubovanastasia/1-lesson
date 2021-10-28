//
//  SearchGroup.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 26.10.2021.
//

import Foundation

struct SearchGroup {
    var id: Int = 0
    var name: String?
    var screenName: String?
    var isClosed: Int = 0
    var type: String?
    var photo50: String?
    
    init (item: [String: Any]) {
        self.id = item["id"] as! Int
        self.name = item["name"] as? String
        self.screenName = item["screen_name"] as? String
        self.isClosed = item["is_closed"] as! Int
        self.type = item["type"] as? String
        self.photo50 = item["photo_50"] as? String
    }
}
