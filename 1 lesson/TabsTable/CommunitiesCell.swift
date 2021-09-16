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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
