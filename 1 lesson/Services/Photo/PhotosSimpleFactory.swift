//
//  PhotosSimpleFactory.swift
//  1 lesson
//
//  Created by Anastasiia Zubova on 14.01.2022.
//

import Foundation
import UIKit

struct PhotoViewModel {
    
    let photoUser: URL?
}

final class PhotoViewModelFactory {
    
    func constructViewModels(from photos: [PhotoModel]) -> [PhotoViewModel] {
        return photos.compactMap(self.viewModel)
    }
    
    private func viewModel(from photos: PhotoModel) -> PhotoViewModel {
        let photo = photos.sizes[0]
        let photoUserUrl = URL(string: photo.url)
        
        return PhotoViewModel(photoUser: photoUserUrl)
    }
}
