//
//  PhotoCollection.swift
//  PhotoCollection
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit

class PhotoCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
    let photosAPI = PhotoAPI()
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photosAPI.getPhoto { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! PhotoCollectionCell
        let photo = photos[indexPath.row]
        cell.imagePhoto?.image = photo.id
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
extension UIImageView {
    func load(url: URL) {
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
