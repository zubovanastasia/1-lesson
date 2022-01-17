//
//  NewsCell4.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 26.11.2021.
//

import Foundation
import UIKit

class NewsCell4: UITableViewCell{
    
    private var number: Int = 0
    
    @IBOutlet weak var likeValueLebel: UILabel!
    @IBOutlet weak var commentValueLebel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
          self.likeValueLebel.text = "\(number)"
      }
      private func removeLike () {
          number = 0
          self.likeValueLebel.text = "\(number)"
      }
    
    @IBAction func likeButton(_ sender: Any) {
        self.pressButton()
    }
    @IBAction func commentButton(_ sender: Any) {
    }
}

