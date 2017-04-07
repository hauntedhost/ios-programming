//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by sean on 4/7/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {

  var photos: [Photo] = []
  let identifier = "PhotoCollectionViewCell"

  // MARK: - UICollectionViewDataSource Protocol

  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
    ) -> Int {
    return photos.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: identifier,
      for: indexPath
    ) as! PhotoCollectionViewCell
    return cell
  }
}
