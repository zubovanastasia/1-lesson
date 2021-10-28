//
//  PhotoAPI.swift
//  PhotoAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire
import UIKit

final class PhotoAPI: UIImageView {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"

    func getPhoto(complition: @escaping([Photo]) -> ()) {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": userId,
            "access_token": token,
            "v": version,
            "no_service_albums": 1,
            "count": 3,
            "extended": 1
        ]

        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in

         guard let data = response.data else { return }
            
            debugPrint(response.data?.prettyJSON)
            
            do {
                let jsonContainer: Any = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let object = jsonContainer as! [String: Any]
                let response = object["response"] as! [String: Any]
                let items = response["items"] as! [String: Any]
                
                let photos = items.map{Photo(item: $0 as! [String: Any])}
                
                complition(photos)
                
            } catch {
                print(error)
        }
    }
}
}
