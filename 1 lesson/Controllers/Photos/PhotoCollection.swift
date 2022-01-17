//
//  PhotoCollection.swift
//  PhotoCollection
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit
import RealmSwift

class PhotoCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let photosAPI = PhotoAPI()
    private let phootosDB = PhotosDB()
    private var photos: Results<PhotoModel>?
    
    private let viewModelFactory = PhotoViewModelFactory()
    private var viewModels: [PhotoViewModel] = []

    
    var friendID: String = ""
    
    func loadPhoto(friendID: String) {
        photosAPI.getPhoto(friendID: friendID) { [weak self] photos in
            guard let self = self else { return }
            self.phootosDB.save(photos ?? [])
            self.photos = self.phootosDB.load()
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       photosAPI.getPhoto(friendID: friendID) { [weak self] photos in
                guard let self = self else { return }
           self.viewModels = self.viewModelFactory.constructViewModels(from: photos ?? [])
                self.collectionView.reloadData()
            }
        }

            /* let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "photo")
    }*/
    
  /*  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }*/

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // guard  let photos = photos else { return 0 }
       // return photos.count
        return viewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       /* let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionCell
        let photo = photos?[indexPath.row]
        guard let url = URL(string: photo?.sizes[0].url ?? "") else { return UICollectionViewCell()}
        cell.imagePhoto.loadImageURL(url: url)
        return cell */
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionCell
            cell.configure(with: viewModels[indexPath.row])
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
