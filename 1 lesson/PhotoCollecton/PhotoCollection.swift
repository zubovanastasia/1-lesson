//
//  PhotoCollection.swift
//  PhotoCollection
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit

class PhotoCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var photoFriends = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! PhotoCollectionCell
        cell.photoFriend.image = UIImage()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize {
        let height: CGFloat = 150
        let row: CGFloat = 3
        let inset: CGFloat = 5
        let totalInset: CGFloat = inset * 3
        let size = self.collectionView.frame.width - totalInset
        let rowWidth = size/row
        return .init(width: rowWidth, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    }

