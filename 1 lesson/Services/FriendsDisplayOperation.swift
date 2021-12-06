//
//  FriendsDisplayOperation.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 06.12.2021.
//

import Foundation
import UIKit

 class FriendsDisplayOperation: Operation {
    
     var friendsPresentController: FriendsController

     override func main() {
         guard let parsedFriendsData = dependencies.first as? FriendsParsingOperation,
               let friendsList = parsedFriendsData.friendsList else { return }
        friendsPresentController.friends = friendsList
         friendsPresentController.tableView.reloadData()
     }

     init(controller: FriendsController) {
         self.friendsPresentController = controller
     }
 }
