//
//  Group.swift
//  Group
//
//  Created by Anastasiia Zubova on 16.09.2021.
//

import Foundation
import RealmSwift
import Realm

// MARK: - Photo
struct PhotoResponse: Codable {
    var response: Response
}

// MARK: - Response
class Response: Codable {
    @objc dynamic var count: Int
    var items: [PhotoModel]
}

// MARK: - Photo
class PhotoModel: Object, Codable {
    @objc dynamic var albumID: Int
    var reposts: Reposts
    @objc dynamic var postID, id, date: Int
    @objc dynamic var text: String
    var sizes: [Size]
    var hasTags: Bool
    @objc dynamic var ownerID: Int
    var likes: Likes
    var photoAvailable: Size?
}
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case reposts
        case postID = "post_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case likes
        
    }

// MARK: - Likes
struct Likes: Codable {
    var userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

// MARK: - Reposts
struct Reposts: Codable {
    var count: Int
}

// MARK: - Size
struct Size: Codable {
    var width, height: Int
    var url: String
    var type: String
}
