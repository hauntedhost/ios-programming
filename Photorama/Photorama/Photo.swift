//
//  Photo.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class Photo {

  // MARK: - Properties

  let title: String
  let remoteURL: URL
  let photoID: String
  let dateTaken: Date

  // MARK: - Initializers

  init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
    self.title = title
    self.photoID = photoID
    self.remoteURL = remoteURL
    self.dateTaken = dateTaken
  }
}
