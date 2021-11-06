//
//  GroupsDB.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 03.11.2021.
//

import Foundation
import RealmSwift
import SwiftUI

protocol GroupsDBProtocol {
    func save(_ group: [GroupModel])
    func load() -> Results<GroupModel>
    func delete(_ group: GroupModel)
}

final class GroupsDB: GroupsDBProtocol {
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 20)
    }
    
    func save(_ group: [GroupModel]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(group)
        }
    }
    
    func load() -> Results<GroupModel> {
        let realm = try! Realm()
        let groups: Results<GroupModel> = realm.objects(GroupModel.self)
        return groups
    }
    
    func delete(_ group: GroupModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(group)
        }
    }
}
