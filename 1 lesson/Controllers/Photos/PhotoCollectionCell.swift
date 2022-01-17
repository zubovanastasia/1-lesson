//
//  PhotoCollectionCell.swift
//  PhotoCollectionCell
//
//  Created by Anastasiia Zubova on 15.09.2021.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with viewModel: PhotoViewModel) {
        
        imagePhoto.loadImageURL(url: viewModel.photoUser!)
    }
}
