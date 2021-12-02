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

    func getPhoto(friendID: String = "", complition: @escaping([PhotoModel]?) -> ()) {
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": friendID,
            "access_token": token,
            "v": version,
            "no_service_albums": 0,
            "count": 10,
            "extended": 1,
            "photo_sizes": 1
        ]
print(parameters)
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in

         guard let data = response.data else { return }
            
            debugPrint(response.data?.prettyJSON as Any)
            
            do {
                let photoResponse = try? JSONDecoder().decode(PhotoResponse.self, from: data)
                let photos = photoResponse?.response.items
        
                complition(photos)
                
            } catch {
                print(error)
        }
    }
}
}
