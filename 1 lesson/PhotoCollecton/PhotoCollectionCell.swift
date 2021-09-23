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
    @IBOutlet weak var like: UIButton!
    
    private var number: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func pressButton() {
    if number == 0 {
        self.addLike()
    }else{
        self.removeLike()
    }
}
    private func addLike () {
        number += 1
        self.likeItem.text = "\(number)"
}
    private func removeLike () {
        number = 0
        self.likeItem.text = "\(number)"
    }
    
    @IBAction private func likeOnOff(_ sender: Any) {
        self.pressButton()
}
}
