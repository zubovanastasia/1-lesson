//
//  NewsCell2.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 24.11.2021.
//

import Foundation
import UIKit

class NewsCell2: UITableViewCell{
    
    var count = 0
    
    @IBOutlet weak var textPost: UILabel!
    @IBOutlet weak var heightTextPost: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureNewsText(newsText: String? = nil) {
        self.textPost.text = newsText
    }
    
    @IBAction func showMorePress(_ sender: Any) {
        let viewController = NewsController()
        count += 1
        if (count % 2) != 0{
            textPost.numberOfLines += 1
            heightTextPost.constant += 30
            viewController.view.layoutIfNeeded()
            
        } else {
            
            textPost.numberOfLines += 5
            heightTextPost.constant += 150
            viewController.view.layoutIfNeeded()
        }
    }
}
