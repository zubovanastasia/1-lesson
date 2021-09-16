//
//  FriendCell.swift
//  FriendCell
//
//  Created by Anastasiia Zubova on 13.09.2021.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageAva: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
