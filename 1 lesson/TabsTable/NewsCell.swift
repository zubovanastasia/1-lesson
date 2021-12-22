//
//  NewsCell.swift
//  NewsCell
//
//  Created by Anastasiia Zubova on 25.09.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    var news: [NewsModel]? = []
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var lebelUser: UILabel!
    @IBOutlet weak var lebelDate: UILabel!
    
    override func awakeFromNib() {
   /*     super.awakeFromNib()
        self.imageAva.image =
        self.lebelName.text =
        self.lebelDate.text =
        self.textText.text =
        self.imageContent.image = */
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(name: String, date: String) {
             self.lebelUser.text = name
             self.lebelDate.text = date
         }
}
