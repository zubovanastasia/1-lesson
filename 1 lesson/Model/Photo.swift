//
//  Group.swift
//  Group
//
//  Created by Anastasiia Zubova on 16.09.2021.
//

import Foundation
import RealmSwift
import SwiftUI


// MARK: - Photo
class PhotoResponse: Object, Codable {
    @objc dynamic var response: Response
}

// MARK: - Response
class Response: Object, Codable {
    @objc dynamic var count: Int
    @objc dynamic var items: [PhotoDB]
}

// MARK: - Photo
class PhotoDB: Object, Codable {
    @objc dynamic var albumID: Int
    @objc dynamic var reposts: Reposts
    @objc dynamic var postID, id, date: Int
    @objc dynamic var text: String
    @objc dynamic var sizes: [Size]
    @objc dynamic var hasTags: Bool
    @objc dynamic var ownerID: Int
    @objc dynamic var likes: Likes
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case reposts
        case postID = "post_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case likes
    }
}

// MARK: - Likes
class Likes: Object, Codable {
    @objc dynamic var userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

// MARK: - Reposts
class Reposts: Object, Codable {
    @objc dynamic var count: Int
}

// MARK: - Size
class Size: Object, Codable {
    @objc dynamic var width, height: Int
    @objc dynamic var url: String
    @objc dynamic var type: String
}
