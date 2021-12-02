//
//  NewsAPI.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 15.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
    
final class NewsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    let scope = ["friends", "photos", "audio", "video", "wall", "groups"]
    
    func getNewsUser(complition: @escaping(NewsModel?) -> ()) {
        
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
            
            let decoder = JSONDecoder()
            let json = JSON(data)
            let dispatchGroup = DispatchGroup()
            
            let vkItemsJSONArr = json["response"]["items"].arrayValue
            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
            let vkGroupsJSONArr = json["response"]["groups"].arrayValue
            
            var vkItemsArr: [NewsItem] = []
            var vkProfilesArr: [Profile] = []
            var vkGroupsArr: [Group] = []
            
            DispatchQueue.global().async (group: dispatchGroup) {
                for (index, items) in vkItemsJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsItem.self, from: items.rawData())
                        vkItemsArr.append(decodedItem)
                    } catch (let errorDecode) {
                        print("Item decoding error at index \(index), error: \(errorDecode)")
                    }
                }
            }
            
            DispatchQueue.global().async (group: dispatchGroup) {
                for (index, profiles) in vkProfilesJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(Profile.self, from: profiles.rawData())
                        vkProfilesArr.append(decodedItem)
                    } catch (let errorDecode) {
                        print("Item decoding error at index \(index), error: \(errorDecode)")
                    }
                }
            }
            
            DispatchQueue.global().async (group: dispatchGroup) {
                for (index, groups) in vkGroupsJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(Group.self, from: groups.rawData())
                        vkGroupsArr.append(decodedItem)
                    } catch (let errorDecode) {
                        print("Item decoding error at index \(index), error: \(errorDecode)")
                    }
                }
            }
            
            dispatchGroup.notify(queue: DispatchQueue.main) {
                let newsResponse = NewsResponse(items: vkItemsArr, groups: vkGroupsArr, profiles: vkProfilesArr, nextFrom: "next_from")
                let news = NewsModel(response: newsResponse)
                
                complition(news)
            }
            
        }
    }
}
