//
//  PhotosViewController.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

  // MARK: - Properties

  var store: PhotoStore!

  // MARK: - Outlets

  @IBOutlet var imageView: UIImageView!

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    FlickrAPI.fetchInterestingPhotos { (photosJSON) -> Void in
      self.store.addPhotos(fromJSON: photosJSON)
      if let firstPhoto = self.store.allPhotos.first {
        print("photo: \(firstPhoto)")
        self.updateImageView(for: firstPhoto)
      }
    }
  }

  // MARK: - Private

  private func updateImageView(for photo: Photo) {
    HTTP.fetchImage(for: photo.remoteURL) { (imageResult) in
      switch imageResult {
      case let .success(image):
        self.imageView.image = image
      case .error:
        print("error downloading image")
      }
    }
  }
}
