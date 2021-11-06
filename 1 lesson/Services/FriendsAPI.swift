//
//  FriendsAPI.swift
//  FriendsAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire

final class FriendsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getFriends(complition: @escaping([FriendsModel]?) -> ()) {
        
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "userId": userId,
            "order": "name",
            "fields": "photo_50, photo_100",
            "count": 50,
            "v": version,
            "access_token": token
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            
            debugPrint(response.data?.prettyJSON as Any)
            
            do {
                let jsonContainer: Any = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let object = jsonContainer as! [String: Any]
                let response = object["response"] as! [String: Any]
                let items = response["items"] as! [Any]
                
                let friends = items.map{FriendsModel(item: $0 as! [String: Any])}
               
                complition(friends)
                
            } catch {
                print(error)
            }
            
        }
    }
}
