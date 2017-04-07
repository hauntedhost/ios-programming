//
//  FlickrAPI.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct FlickrAPI {

//  enum Result {
//    case success([Photo])
//    case failure(Error)
//  }

  enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
  }

  // MARK: - Public API

  public static func fetchInterestingPhotos(completion: @escaping (Data?) -> Void) {
    let url = FlickrAPI.interestingPhotosURL
    let request = URLRequest(url: url)
    let task = session.dataTask(with: request) { (data, resp, err) -> Void in
      completion(data)
    }
    task.resume()
  }

  // MARK: - Private

  private static let apiKey = "4b68c56efb9ab2fbfbf41df0f1bd72c9"
  private static let baseURLString = "https://api.flickr.com/services/rest"

  private static let session: URLSession = {
    return URLSession(
      configuration: URLSessionConfiguration.default
    )
  }()

  private static var interestingPhotosURL: URL {
    return flickrURL(
      method: .interestingPhotos,
      params: [
        "extras": "url_h,url_c,date_taken",
        "per_page": "10",
        ]
    )
  }

  private static func flickrURL(method: Method) -> URL {
    return flickrURL(method: method, params: [:])
  }

  private static func flickrURL(
    method: Method,
    params: [String:String]?
  ) -> URL {
    let baseParams = [
      "method": method.rawValue,
      "format": "json",
      "nojsoncallback": "1",
      "api_key": apiKey,
    ]

    let queryItems: [URLQueryItem] =
      newQueryItems(baseParams) +
      newQueryItems(params)

    var components = URLComponents(string: baseURLString)!
    components.queryItems = queryItems

    return components.url!
  }

  private static func newQueryItems(
    _ params: [String:String]?
  ) -> [URLQueryItem] {
    guard let newParams = params else {
      return []
    }

    return newParams.map {
      URLQueryItem(name: $0, value: $1)
    }
  }
}
