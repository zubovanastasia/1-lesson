//
//  Group.swift
//  Group
//
//  Created by Anastasiia Zubova on 16.09.2021.
//

import Foundation

struct Photo {
    var id: Int = 0
    var albumId: Int = 0
    var ownerId: Int = 0
    let sizes: String?
    let text: String?
    let date: Int
    let likes: Int
    let realOffset: Int
    
    init (item: [String: Any]) {
        self.id = item["id"] as! Int
        self.albumId = item["album_id"] as! Int
        self.ownerId = item["owner_id"] as! Int
        self.sizes = item["sizes"] as? String
        self.text = item["text"] as? String
        self.date = item["date"] as! Int
        self.likes = item["likes"] as! Int
        self.realOffset = item["real_offset"] as! Int
        
    }
}
