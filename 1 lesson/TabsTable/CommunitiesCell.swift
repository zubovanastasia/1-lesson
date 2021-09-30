//
//  CommunitiesCell.swift
//  CommunitiesCell
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit

class CommunitiesCell: UITableViewCell {
    
    @IBOutlet weak var nameCommunity: UILabel!
    @IBOutlet weak var imageCommunity: UIImageView!
    @IBOutlet weak var viewComShadow: UIView!
    
    override func awakeFromNib() {
        imageCommunity.layer.cornerRadius = 35/2
        imageCommunity.contentMode = .scaleAspectFill
        imageCommunity.layer.masksToBounds = true
        viewComShadow.layer.shadowColor = UIColor.white.cgColor
        viewComShadow.backgroundColor! = .clear
        viewComShadow.layer.shadowOffset = .init(width: 7, height: 0)
        viewComShadow.layer.shadowOpacity = 0.3
        viewComShadow.layer.shadowRadius = 5
        viewComShadow.layer.shadowPath = UIBezierPath(roundedRect: viewComShadow.bounds, cornerRadius: imageCommunity.layer.cornerRadius).cgPath
        viewComShadow.addSubview(imageCommunity)
        viewComShadow.layer.masksToBounds = false
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
