//
//  NewsCell3.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 26.11.2021.
//

import Foundation
import UIKit

class NewsCell3: UITableViewCell{
    
    @IBOutlet weak var imagePost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func prepareForReuse() {
        imagePost.image = nil
    }
    
    func configure(url: String? = nil) {
    
        guard let url = URL(string: url ?? "") else { return }
        imagePost.loadImageURL(url: url)
    }
}
