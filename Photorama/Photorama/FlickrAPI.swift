//
//  FlickrAPI.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct FlickrAPI {

  enum APIMethod: String {
    case interestingPhotos = "flickr.interestingness.getList"
  }

  public static func fetchInterestingPhotos(
    completion: @escaping ([[String:Any]]?) -> Void
  ) {
    let url = interestingPhotosURL
    let request = URLRequest(url: url)
    let task = HTTP.session.dataTask(with: request) { (data, resp, err) -> Void in
      let result = self.getPhotos(fromJSON: data)
      OperationQueue.main.addOperation {
        completion(result)
      }
    }
    task.resume()
  }

  // MARK: - Private

  private static let apiKey = "4b68c56efb9ab2fbfbf41df0f1bd72c9"
  private static let baseURLString = "https://api.flickr.com/services/rest"
  private static let photosPerPage = "50"

  private static func getPhotos(fromJSON data: Data?) -> [[String:Any]]? {
    guard
      let json = JSON.parse(data),
      let jsonRoot = json as? [AnyHashable:Any],
      let photosRoot = jsonRoot["photos"] as? [String:Any],
      let photos = photosRoot["photo"] as? [[String:Any]]
    else {
      return nil
    }

    return photos
  }

  private static func flickrURL(method: APIMethod) -> URL {
    return flickrURL(method: method, params: [:])
  }

  private static func flickrURL(
    method: APIMethod,
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

  private static var interestingPhotosURL: URL {
    return flickrURL(
      method: .interestingPhotos,
      params: [
        "extras": "url_c,url_h,date_taken",
        "per_page": photosPerPage,
        ]
    )
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
