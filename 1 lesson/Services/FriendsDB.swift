//
//  FriendsDB.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 02.11.2021.
//

import Foundation
import RealmSwift
import SwiftUI

protocol FriendsDBProtocol {
    func save(_ friend: [FriendsModel])
    func load() -> Results<FriendsModel>
    func delete(_ friend: FriendsModel)
}

final class FriendsDB: FriendsDBProtocol {
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 20)
    }
    
    func save(_ friend: [FriendsModel]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(friend)
        }
    }
    
    func load() -> Results<FriendsModel> {
        let realm = try! Realm()
        let friends: Results<FriendsModel> = realm.objects(FriendsModel.self)
        return friends
    }
    
    func delete(_ friend: FriendsModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(friend)
        }
    }
}
