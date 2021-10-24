//
//  FriendsAPI.swift
//  FriendsAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire

struct Friends {
    
}
final class FriendsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getFriends(complition: @escaping([Friends]) -> ()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "userId": userId,
            "order": "name",
            "fields": "photo_50, photo_100",
            "count": 10,
            "v": version,
            "access_token": token
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.value)
        }
    }
}
