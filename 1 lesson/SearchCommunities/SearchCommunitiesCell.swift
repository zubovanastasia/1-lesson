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
        viewSearchShadow.layer.masksToBounds = false
        viewSearchShadow.layer.shadowColor = UIColor.white.cgColor
        viewSearchShadow.backgroundColor! = .clear
        viewSearchShadow.layer.shadowOffset = .init(width: 100, height: 100)
        viewSearchShadow.layer.shadowOpacity = 10
        viewSearchShadow.layer.shadowRadius = 10
        viewSearchShadow.layer.shadowPath = UIBezierPath(roundedRect: viewSearchShadow.bounds, cornerRadius: imageSearchComm.layer.cornerRadius).cgPath
        viewSearchShadow.addSubview(imageSearchComm)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
