//
//  Photo.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct Photo {

  // MARK: - Properties

  let title: String
  let remoteURL: URL
  let photoID: String
  let dateTaken: Date

  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
  }()

  // MARK: - Initializers

  init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
    self.title = title
    self.photoID = photoID
    self.remoteURL = remoteURL
    self.dateTaken = dateTaken
  }

  init?(fromJSON json: [String:Any]) {
    guard
      let title = json["title"] as? String,
      let photoID = json["id"] as? String,
      let dateString = json["datetaken"] as? String,
      let dateTaken = Photo.dateFormatter.date(from: dateString),
      let photoURLString = json["url_c"] as? String,
      let remoteURL = URL(string: photoURLString)
      else {
        return nil
    }

    self.init(
      title: title,
      photoID: photoID,
      remoteURL: remoteURL,
      dateTaken: dateTaken
    )
  }
}
