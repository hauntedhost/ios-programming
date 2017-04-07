//
//  PhotoStore.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

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

  private func processPhotosRequest(data: Data?, error: Error?) -> PhotosResult {
    guard let jsonData = data else {
      return .failure(error!)
    }
    return FlickrAPI.photos(fromJSON: jsonData)
  }
}
