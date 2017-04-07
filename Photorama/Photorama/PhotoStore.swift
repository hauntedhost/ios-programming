//
//  PhotoStore.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

enum ImageResult {
  case success(UIImage)
  case failure(Error)
}

enum PhotoError: Error {
  case imageCreationError
}

enum PhotosResult {
  case success([Photo])
  case failure(Error?)
}

class PhotoStore {

  private let session: URLSession = {
    return URLSession(
      configuration: URLSessionConfiguration.default
    )
  }()

  public func fetchInterestingPhotos(
    completion: @escaping (PhotosResult) -> Void
  ) {
    let url = FlickrAPI.interestingPhotosURL
    let request = URLRequest(url: url)
    let task = session.dataTask(with: request) { (data, resp, err) -> Void in
      let result = self.processPhotosRequest(data: data, error: err)
      completion(result)
    }
    task.resume()
  }

  public func fetchImage(
    for photo: Photo,
    completion: @escaping (ImageResult) -> Void
  ) {
    let photoURL = photo.remoteURL
    let request = URLRequest(url: photoURL)
    let task = session.dataTask(with: request) { (data, resp, err) -> Void in
      let result = self.processImageRequest(data: data, error: err)
      completion(result)
    }
    task.resume()
  }

  private func processImageRequest(data: Data?, error: Error?) -> ImageResult {
    guard
      let imageData = data,
      let image = UIImage(data: imageData)
    else {
      if data == nil {
        return .failure(error!)
      } else {
        return .failure(PhotoError.imageCreationError)
      }
    }
    return .success(image)
  }

  private func processPhotosRequest(data: Data?, error: Error?) -> PhotosResult {
    guard let jsonData = data else {
      return .failure(error!)
    }
    return FlickrAPI.photos(fromJSON: jsonData)
  }
}
