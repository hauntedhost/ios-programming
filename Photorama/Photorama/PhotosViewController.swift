//
//  PhotosViewController.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

  var store: PhotoStore!

  @IBOutlet var imageView: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()

    store.fetchInterestingPhotos { (photosResult:PhotosResult) -> Void in
      switch photosResult {
      case let .success(photos):
        print("found: \(photos.count) photos")
        if let firstPhoto = photos.first {
          self.updateImageView(for: firstPhoto)
        }
      case let .failure(error):
        print("error: \(error)")
      }
    }
  }

  func updateImageView(for photo: Photo) {
    store.fetchImage(for: photo) { (imageResult) in
      switch imageResult {
      case let .success(image):
        self.imageView.image = image
      case let .failure(error):
        print("error downloading image: \(error)")
      }
    }
  }
}
