//
//  GroupsAPIAdapter.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 11.01.2022.
//

import Foundation
import RealmSwift
import StoreKit

final class GroupsAPIAdapter {
    
    private let groupsAPI = GroupsAPI()
    
    private var realmNotificationTokens: [Int: NotificationToken] = [:]
    
    func getGroupsAdapter(inId id: Int, then completion: @escaping ([GroupModelAdapter]) -> Void) {
        guard let realm = try? Realm(),
              let realmId = realm.object(ofType: GroupModel.self, forPrimaryKey: id)
        else { return }
        
        self.realmNotificationTokens[id]?.invalidate()
        
        let token = realmId.name?.observe { [weak self] changes in
            
            guard let tableView = self?.tableView else { return }
            
            switch changes {
            case .update(let realmGroups, _, _, _):
                var groups: [GroupModelAdapter] = []
                for realmGroup in realmGroups {
                    groups.append(self.group(from: realmGroup))
                }
                self.realmNotificationTokens[id]?.invalidate()
                completion(groups)
            case .error(let error):
                fatalError("\(error)")
            case .initial :
                break
            }
        }
        
        self.realmNotificationTokens[id] = token
        
        groupsAPI.getGroups()
    }
    
    private func group(from rlmGroup: GroupModel) -> GroupModelAdapter {
        return GroupModelAdapter(id: rlmGroup.id,
                                 name: rlmGroup.name,
                                 screenName: rlmGroup.screenName,
                                 isClosed: rlmGroup.isClosed,
                                 type: rlmGroup.type,
                                 photo50: rlmGroup.photo50)
        
    }
}
