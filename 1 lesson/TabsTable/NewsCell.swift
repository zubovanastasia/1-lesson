//
//  NewsCell.swift
//  NewsCell
//
//  Created by Anastasiia Zubova on 25.09.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
  // private var number: Int = 0
    
    @IBOutlet weak var imageAva: UIImageView!
    @IBOutlet weak var lebelName: UILabel!
    @IBOutlet weak var lebelDate: UILabel!
    @IBOutlet weak var textText: UITextView!
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var lebelLike: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   /*     self.imageAva.image = UIImage(named: "1")
        self.lebelName.text = "Искусство"
        self.lebelDate.text = "Вчера в 11:42"
        self.textText.text = "Обновлено главное фото сообщества"
        self.imageContent.image = UIImage(named: "1")
        */
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  /*  private func pressButton() {
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
    }*/
}
