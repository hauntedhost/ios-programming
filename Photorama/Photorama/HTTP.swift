//
//  HTTP.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

struct HTTP {

  enum ImageResult {
    case success(UIImage)
    case error
  }

  public static let session: URLSession = {
    return URLSession(
      configuration: URLSessionConfiguration.default
    )
  }()

  public static func fetchImage(
    for imageURL: URL,
    completion: @escaping (ImageResult) -> Void
  ) {
    let request = URLRequest(url: imageURL)
    let task = session.dataTask(with: request) { (data, resp, err) -> Void in
      let result = self.processImage(data)
      OperationQueue.main.addOperation {
        completion(result)
      }
    }
    task.resume()
  }

  private static func processImage(_ data: Data?) -> ImageResult {
    guard
      let imageData = data,
      let image = UIImage(data: imageData)
    else {
      return .error
    }
    return .success(image)
  }
}
