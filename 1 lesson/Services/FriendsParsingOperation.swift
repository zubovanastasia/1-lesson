//
//  FriendsParsingOperation.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 06.12.2021.
//

import Foundation
import UIKit

class FriendsParsingOperation: Operation {
    var friendsList: [FriendsModel]? = []
    
    override func main() {
        guard let friendsData = dependencies.first as? FriendsDataOperation,
              let data = friendsData.data else { return }
        do {
            let jsonContainer: Any = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let object = jsonContainer as! [String: Any]
            let response = object["response"] as! [String: Any]
            let items = response["items"] as! [Any]
            
            let friends = items.map{FriendsModel(item: $0 as! [String: Any])}
            
        } catch {
            print(error)
        }
    }
}

