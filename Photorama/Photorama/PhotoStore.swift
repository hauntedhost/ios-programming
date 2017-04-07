//
//  PhotoStore.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class PhotoStore {

  var allPhotos: [Photo] = []

  func photos(fromJSON data: Data) -> [Any]? {
    do {
      
    } catch {
      return nil
    }
  }

  func getPhotos() {
    FlickrAPI.fetchInterestingPhotos { (data: Data?) in
      if let json = JSON.parse(data) {
        print(json)
      } else {
        print("nope")
      }
    }
  }
}
