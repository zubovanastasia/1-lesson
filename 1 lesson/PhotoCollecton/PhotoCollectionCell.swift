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
}
/*func configure(with item: AddLike) {
    self.like = item.addLike
    self.like = item.removeLike
    self.like(item.addLike, animated: true)
}
}
    @IBAction func likeOnOff(_ sender: Any) {
       // self.likeItem.text = sender.value.round(1).likeItem
}
struct AddLike {
    let addLike = "1"
    let removeLike = "0"
}
*/
