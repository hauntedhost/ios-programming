//
//  PhotoStore.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

struct PhotoStore {

  // MARK: - Properties

  var allPhotos: [Photo] = []

  // MARK: - Public API

  public mutating func addPhotos(fromJSON photosJSON: [[String:Any]]?) {
    if let photosJSON = photosJSON {
      for json in photosJSON {
        if let photo = Photo(fromJSON: json) {
          allPhotos.append(photo)
        }
      }
    }
  }
}
