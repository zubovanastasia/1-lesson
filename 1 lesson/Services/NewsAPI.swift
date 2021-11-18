//
//  NewsAPI.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 15.11.2021.
//

import Foundation
import Alamofire

final class NewsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    let scope = ["friends", "photos", "audio", "video", "wall", "groups"]
    
    func getNewsUser(complition: @escaping([NewsItem]?) -> ()) {
        
        let method = "/newsfeed.get"
        
        let parameters: Parameters = [
            "userId": userId,
            "filters": "post, wall_photo, audio, video",
            "return_banned": 0,
            "max_photos": 10,
            "count": 10,
            "access_token": token,
            "v": version,
            "scope": scope
        ]
        
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
           guard let data = response.data else { return }
            
            debugPrint(response.data?.prettyJSON as Any)
               
               do {
                   let newsResponse = try? JSONDecoder().decode(NewsModel.self, from: data)
                   let news = newsResponse?.response.items
           
                   complition(news)
                   
               } catch {
                   print(error)
           }
            
        }
    }
}
