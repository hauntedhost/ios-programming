//
//  FlickrAPI.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

enum FlickrError: Error {
  case invalidJSONData
}

enum Method: String {
  case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI {

  // MARK: - Public API

  static var interestingPhotosURL: URL {
    return flickrURL(
      method: .interestingPhotos,
      params: [
        "extras": "url_h,url_c,date_taken",
        "per_page": "10",
      ]
    )
  }

  static func photos(fromJSON data: Data) -> PhotosResult {
    if let json = JSON.parse(data) {
      guard
        let jsonHash = json as? [AnyHashable:Any],
        let photos = jsonHash["photos"] as? [String:Any],
        let photosArray = photos["photo"] as? [[String:Any]]
      else {
        return .failure(FlickrError.invalidJSONData)
      }

      var finalPhotos: [Photo] = []
      for photoJSON in photosArray {
        if let photo = photo(fromJSON: photoJSON) {
          finalPhotos.append(photo)
        }
      }

      if finalPhotos.isEmpty && !photosArray.isEmpty {
        return .failure(FlickrError.invalidJSONData)
      }

      return .success(finalPhotos)
    } else {
      return .failure(nil)
    }
  }

  static func photo(fromJSON json: [String:Any]) -> Photo? {
    guard
      let title = json["title"] as? String,
      let photoID = json["id"] as? String,
      let dateString = json["datetaken"] as? String,
      let dateTaken = dateFormatter.date(from: dateString),
      let photoURLString = json["url_c"] as? String,
      let remoteURL = URL(string: photoURLString)
    else {
      return nil
    }

    return Photo(
      title: title,
      photoID: photoID,
      remoteURL: remoteURL,
      dateTaken: dateTaken
    )
  }

  // MARK: - Private

  private static let apiKey = "4b68c56efb9ab2fbfbf41df0f1bd72c9"
  private static let baseURLString = "https://api.flickr.com/services/rest"

  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
  }()

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
