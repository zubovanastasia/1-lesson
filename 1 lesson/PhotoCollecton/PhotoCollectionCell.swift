//
//  PhotoCollectionCell.swift
//  PhotoCollectionCell
//
//  Created by Anastasiia Zubova on 15.09.2021.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var photoFriend: UIImageView!
    @IBOutlet weak var likeItem: UILabel!
    
    private var number: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func likeOnOff(_ sender: Any) {
        }
}
