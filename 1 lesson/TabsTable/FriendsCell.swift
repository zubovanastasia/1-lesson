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
    
    @IBOutlet weak var viewShadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageAva.layer.cornerRadius = 35/2
        imageAva.contentMode = .scaleAspectFill
        imageAva.layer.masksToBounds = true
        viewShadow.layer.masksToBounds = false
        viewShadow.layer.shadowColor = UIColor.white.cgColor
        viewShadow.backgroundColor! = .clear
        viewShadow.layer.shadowOffset = .init(width: 100, height: 100)
        viewShadow.layer.shadowOpacity = 10
        viewShadow.layer.shadowRadius = 10
        viewShadow.layer.shadowPath = UIBezierPath(roundedRect: viewShadow.bounds, cornerRadius: imageAva.layer.cornerRadius).cgPath
        viewShadow.addSubview(imageAva)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
