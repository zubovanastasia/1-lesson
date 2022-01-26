//
//  SearchCommunitiesAPI.swift
//  SearchCommunitiesAPI
//
//  Created by Anastasiia Zubova on 20.10.2021.
//

import Foundation
import Alamofire
import RealmSwift

protocol SearchGroupsInterface {

    func getSearchGroups(complition: @escaping([SearchGroupModel]) -> ())
}

final class SearchGroupsAPI: SearchGroupsInterface {
    
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"

    func getSearchGroups(complition: @escaping([SearchGroupModel]) -> ()) {
        
        let method = "/groups.search"
        
        let parameters: Parameters = [
            "access_token": token,
            "v": version,
            "q": "Music"
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
                
                let searchGroups = items.map{SearchGroupModel(item: $0 as! [String: Any])}
                complition(searchGroups)
                
            } catch {
                print(error)
            }
        }
    }
}

final class SearchGroupsServiceProxyLog: SearchGroupsInterface {
    let searchGroupsService: SearchGroupsAPI
    
    init(searchGroupsService: SearchGroupsAPI) {
        self.searchGroupsService = searchGroupsService
    }
    func getSearchGroups(complition: @escaping ([SearchGroupModel]) -> ()) {
        self.searchGroupsService.getSearchGroups(complition: complition)
        print("User groups")
    }
}


final class SearchGroupsServiceProxyControl: SearchGroupsInterface {
    let searchGroupsService: SearchGroupsAPI
    
    init(searchGroupsService: SearchGroupsAPI) {
        self.searchGroupsService = searchGroupsService
    }
    func getSearchGroups(complition: @escaping ([SearchGroupModel]) -> ()) {
        guard Session.shared.accessGranted else { return }
        self.searchGroupsService.getSearchGroups(complition: complition)
    }
}

/* final class SearchGroupsServiceProxyCache: SearchGroupsInterface {
    
    let searchGroupsService: SearchGroupsAPI
    var cache: [String: [SearchGroupModel]] = [:]
    
    
    init(searchGroupsService: SearchGroupsAPI) {
        self.searchGroupsService = searchGroupsService
    }
    
    func getSearchGroups(complition: @escaping ([SearchGroupModel]) -> ()) {
        if let searchGroupsFromCache = self.cache[] {
            return searchGroupsFromCache
        }
        self.searchGroupsService.getSearchGroups { [weak self] searchGroups in
            self?.cache = searchGroups
            complition(searchGroups)
        }
    }
} */

