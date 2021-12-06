//
//  FriendsDataOperation.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 06.12.2021.
//

import Foundation
import UIKit
import Alamofire

class FriendsDataOperation: Operation {
    var data: Data?
    
    override func main() {
        let version = "5.81"
        var requestConstructor = URLComponents()
        requestConstructor.scheme = "https"
        requestConstructor.host = "api.vk.com"
        requestConstructor.path = "/method/friends.get"
        requestConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.shared.userId)"),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_50,online"),
            URLQueryItem(name: "access_token", value: version)
        ]
        guard let url = requestConstructor.url else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        self.data = data
    }
}
