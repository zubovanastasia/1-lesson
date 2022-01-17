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

struct GroupModelAdapter {
    var id: Int = 0
    var name: String?
    var screenName: String?
    var isClosed: Int = 0
    var type: String?
    var photo50: String?
}
/*
import Foundation

// MARK: - Main
struct Groups: Codable {
    let response: GroupResponse
}

// MARK: - Response
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]
}

// MARK: - Item
class GroupItem: Codable {
    var id: Int = 0
    var name: String = ""
    var groupDescription: String?
    var imageURL: String = ""
    var membersCount: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }
}*/
