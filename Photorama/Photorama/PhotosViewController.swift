//
//  PhotosViewController.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

  // MARK: - Properties

  var store: PhotoStore!
  var dataSource = PhotoDataSource()

  // MARK: - Outlets

  @IBOutlet var collectionView: UICollectionView!

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.delegate = self
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

  func collectionView(
    _ collectionView: UICollectionView,
    willDisplay cell: UICollectionViewCell,
    forItemAt indexPath: IndexPath
  ) {
    let photo = dataSource.photos[indexPath.row]
    HTTP.fetchImage(for: photo.remoteURL) { (imageResult) in
      switch imageResult {
      case let .success(image):
        guard let photoIndex = self.dataSource.photos.index(of: photo) else {
          return
        }

        let photoIndexPath = IndexPath(item: photoIndex, section: 0)
        if let cell = self.collectionView.cellForItem(
          at: photoIndexPath
        ) as? PhotoCollectionViewCell {
          cell.update(with: image)
        }

      case .error:
        print("error downloading image")
      }
    }
  }
}
