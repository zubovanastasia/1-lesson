//
//  SearchCommunitiesCell.swift
//  SearchCommunitiesCell
//
//  Created by Anastasiia Zubova on 15.09.2021.
//

import UIKit

class SearchCommunitiesCell: UITableViewCell {
    
    @IBOutlet weak var nameCommunities: UILabel!
    @IBOutlet weak var imageSearchComm: UIImageView!
    @IBOutlet weak var viewSearchShadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageSearchComm.layer.cornerRadius = 35/2
        imageSearchComm.contentMode = .scaleAspectFill
        imageSearchComm.layer.masksToBounds = true
        viewSearchShadow.layer.shadowColor = UIColor.white.cgColor
        viewSearchShadow.backgroundColor! = .clear
        viewSearchShadow.layer.shadowOffset = .init(width: -5, height: 0)
        viewSearchShadow.layer.shadowOpacity = 0.3
        viewSearchShadow.layer.shadowRadius = 5
        viewSearchShadow.layer.shadowPath = UIBezierPath(roundedRect: viewSearchShadow.bounds, cornerRadius: imageSearchComm.layer.cornerRadius).cgPath
        viewSearchShadow.addSubview(imageSearchComm)
        viewSearchShadow.layer.masksToBounds = false
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
