//
//  Session.swift
//  Session
//
//  Created by Anastasiia Zubova on 18.10.2021.
//

import Foundation
import Firebase

    class Session {
    
    static let shared = Session(userId: "")
    var token: String = ""
    var userId: String = ""
    var ref: DatabaseReference?
    
    init (userId: String) {
        self.ref = nil
        self.userId = userId
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let userId = value["user_id"] as? String else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.userId = userId
    }
    
    func toAnyObject() -> [AnyHashable: Any] {
        return ["user_id": userId] as [AnyHashable: Any]
    }
}
