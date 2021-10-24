//
//  SearchCommunitiesAPI.swift
//  SearchCommunitiesAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire

struct SearchCommunities {
    
}
final class SearchCommunitiesAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"

    func getSearchGroups(complition: @escaping([SearchCommunities]) -> ()) {
        
        let method = "/groups.search"
        
        let parameters: Parameters = [
            "access_token": token,
            "v": version,
            "q": "Music"
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.value)
        }
    }
}
