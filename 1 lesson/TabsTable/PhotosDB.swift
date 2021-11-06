//
//  PhotosDB.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 03.11.2021.
//

import Foundation
import RealmSwift
import SwiftUI

protocol PhotosDBProtocol {
    func save(_ photo: [PhotoModel])
    func load() -> Results<PhotoModel>
    func delete(_ photo: PhotoModel)
}

final class PhotosDB: PhotosDBProtocol {
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 20)
    }
    
    func save(_ photo: [PhotoModel]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(photo)
        }
    }
    
    func load() -> Results<PhotoModel> {
        let realm = try! Realm()
        let photos: Results<PhotoModel> = realm.objects(PhotoModel.self)
        return photos
    }
    
    func delete(_ photo: PhotoModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(photo)
        }
    }
}
