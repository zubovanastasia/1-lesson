//
//  PhotoCollection.swift
//  PhotoCollection
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit

class PhotoCollectionController: UICollectionViewController {
    var photoFriends = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoFriends.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath)
    }
    }

