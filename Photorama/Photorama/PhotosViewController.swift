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
  var dataSource = PhotoDataSource()

  // MARK: - Outlets

  @IBOutlet var collectionView: UICollectionView!

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.dataSource = dataSource

    FlickrAPI.fetchInterestingPhotos { (photosJSON) -> Void in
      self.store.addPhotos(fromJSON: photosJSON)
      self.dataSource.photos = self.store.allPhotos
      self.collectionView.reloadSections(IndexSet(integer: 0))

      print("found \(self.store.allPhotos.count) photos")
      if let firstPhoto = self.store.allPhotos.first {
        print("photo: \(firstPhoto)")
      }
    }
  }

  // MARK: - Private

//  private func updateImageView(for photo: Photo) {
//    HTTP.fetchImage(for: photo.remoteURL) { (imageResult) in
//      switch imageResult {
//      case let .success(image):
//        self.imageView.image = image
//      case .error:
//        print("error downloading image")
//      }
//    }
//  }
}
