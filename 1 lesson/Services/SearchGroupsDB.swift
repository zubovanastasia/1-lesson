//
//  SearchGroupsDB.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 03.11.2021.
//

import Foundation
import RealmSwift
import SwiftUI

protocol SearchGroupsDBProtocol {
    func save(_ searchGroup: [SearchGroupModel])
    func load() -> Results<SearchGroupModel>
    func delete(_ searchGroup: SearchGroupModel)
}

final class SearchGroupsDB: SearchGroupsDBProtocol {
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 20)
    }
    
    func save(_ searchGroup: [SearchGroupModel]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(searchGroup)
        }
    }
    
    func load() -> Results<SearchGroupModel> {
        let realm = try! Realm()
        let searchGroups: Results<SearchGroupModel> = realm.objects(SearchGroupModel.self)
        return searchGroups
    }
    
    func delete(_ searchGroup: SearchGroupModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(searchGroup)
        }
    }
}
