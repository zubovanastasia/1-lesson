//
//  R.swift
//  R
//
//  Created by Anastasiia Zubova on 24.09.2021.
//

import UIKit

enum R {
    enum Storyboard {
        static let tabBarS: UIStoryboard = .init(name: "TabBar", bundle: nil)
        static let friendS: UIStoryboard = .init(name: "Friends", bundle: nil)
        static let communitiesS: UIStoryboard = .init(name: "Communities", bundle: nil)
        static let photoS: UIStoryboard = .init(name: "PhotoCollection", bundle: nil)
        static let searchCommunitiesS: UIStoryboard = .init(name: "SearchCommunities", bundle: nil)
    }
    enum Nib {
        static let friendC: UINib = .init(nibName: "FriendsController", bundle: nil)
        static let communitiesC: UINib = .init(nibName: "CommunitiesController", bundle: nil)
        static let photoC: UINib = .init(nibName: "PhotoCollection", bundle: nil)
        static let searchC: UINib = .init(nibName: "SearchCommunities", bundle: nil)
    }
    enum Cell {
        static let friendC: String = "FriendsCell"
        static let communitiesC: String = "CommunitiesCell"
        static let photoC: String = "PhotoCollectionCell"
        static let searchC: String = "SearchCommunitiesCell"
    }
}
