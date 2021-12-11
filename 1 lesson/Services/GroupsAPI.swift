//
//  CommunitiesAPI.swift
//  CommunitiesAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire
import PromiseKit

final class GroupsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getGroups() -> Promise<[GroupModel]> {
        return Promise<[GroupModel]> { resolver in
            
            let method = "/groups.get"
            
            let parameters: Parameters = [
                "user_id": userId,
                "access_token": token,
                "v": version,
                "extended": 1
            ]
            let url = baseURL + method
            
            AF.request(url, method: .get, parameters: parameters).responseJSON { response in
                
                if let error = response.error {
                    resolver.reject(error)
                }
                if let data = response.data {
                    
                    debugPrint(response.data?.prettyJSON as Any)
                    
                    do {
                        let jsonContainer: Any = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                        let object = jsonContainer as! [String: Any]
                        let response = object["response"] as! [String: Any]
                        let items = response["items"] as! [Any]
                        
                        let groups = items.map{GroupModel(item: $0 as! [String: Any])}
                        resolver.fulfill(groups)
                        
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
