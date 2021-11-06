//
//  UIImageView+load.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 05.11.2021.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImageURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
