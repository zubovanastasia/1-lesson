//
//  NewsCell.swift
//  NewsCell
//
//  Created by Anastasiia Zubova on 25.09.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    private var number: Int = 0
    
    @IBOutlet private weak var imageAva: UIImageView!
    @IBOutlet private weak var lebelName: UILabel!
    @IBOutlet private weak var lebelDate: UILabel!
    @IBOutlet private weak var textText: UITextView!
    @IBOutlet private weak var imageContent: UIImageView!
    @IBOutlet private weak var lebelLike: UILabel!
    
    override func awakeFromNib() {
        self.imageAva.image = UIImage(named: "1")
        self.lebelName.text = "Искусство"
        self.lebelDate.text = "Вчера в 11:42"
        self.textText.text = "Обновлено главное фото сообщества"
        self.imageContent.image = UIImage(named: "1")
        
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
        self.lebelLike.text = "\(number)"
    }
    private func removeLike () {
        number = 0
        self.lebelLike.text = "\(number)"
    }
    
    @IBAction private func buttonLike(_ sender: Any) {
        self.pressButton()
    }
    @IBAction private func buttonComment(_ sender: Any) {
    }
    @IBAction private func buttonShare(_ sender: Any) {
    }
}
