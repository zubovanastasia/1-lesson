//
//  NewsCell.swift
//  NewsCell
//
//  Created by Anastasiia Zubova on 25.09.2021.
//

import UIKit

@available(iOS 15.0, *)

class NewsCell: UITableViewCell {
    
    var news: [NewsModel]? = []
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var lebelUser: UILabel!
    @IBOutlet weak var lebelDate: UILabel!
    
    override func awakeFromNib() {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageUser.image = nil
    }
    
    @available(iOS 15.0, *)
    func configure(profile: Profile? = nil, group: Group? = nil, postDate: Int) {
        
        if let group = group {
            lebelUser.text = group.name
            let url = URL(string: group.photo100)
            imageUser.loadImageURL(url: url!)
        } else if let profile = profile {
            lebelUser.text = "\(profile.firstName) \(profile.lastName)"
            let url = URL(string: profile.photo100)
            imageUser.loadImageURL(url: url!)
        }
        lebelDate.text = postDate.formatted()
    }
}

