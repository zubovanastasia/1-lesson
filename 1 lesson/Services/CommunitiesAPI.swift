//
//  CommunitiesAPI.swift
//  CommunitiesAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire

struct Communities {
    
}
final class CommunitiesAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"

    func getGroups(complition: @escaping([Communities]) -> ()) {
        
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "access_token": token,
            "v": version,
            "extended": 1
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.value)
        }
    }
}
