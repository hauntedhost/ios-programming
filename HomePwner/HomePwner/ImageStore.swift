//
//  ImageStore.swift
//  HomePwner
//
//  Created by sean on 4/5/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ImageStore {

  // MARK: - Properties

  let cache = NSCache<NSString, UIImage>()

  // MARK: - Public API

  func deleteImage(forKey key: String) {
    deleteCachedImage(forKey: key)
    deleteDiskImage(forKey: key)
  }

  func getImage(forKey key: String) -> UIImage? {
    if let image = getCachedImage(forKey: key) {
      print("image from cache")
      return image
    } else if let image = getDiskImage(forKey: key) {
      print("image from disk (saving to cache)")
      setCachedImage(image, forKey: key)
      return image
    } else {
      print("image not found")
      return nil
    }
  }

  func setImage(_ image: UIImage, forKey key: String) {
    setCachedImage(image, forKey: key)
    setDiskImage(image, forKey: key)
  }

  // MARK: - Private

  private func deleteCachedImage(forKey key: String) {
    cache.removeObject(forKey: key as NSString)
  }

  private func deleteDiskImage(forKey key: String) {
    let url = imageURL(forKey: key)
    do {
      try FileManager.default.removeItem(at: url)
    } catch let error {
      print("[ERROR] deleting image from disk: \(error)")
    }
  }

  private func getCachedImage(forKey key: String) -> UIImage? {
    return cache.object(forKey: key as NSString)
  }

  private func getDiskImage(forKey key: String) -> UIImage? {
    let url = imageURL(forKey: key)
    return UIImage(contentsOfFile: url.path)
  }

  private func setCachedImage(_ image: UIImage, forKey key: String) {
    cache.setObject(image, forKey: key as NSString)
  }

  private func setDiskImage(_ image: UIImage, forKey key: String) {
    let url = imageURL(forKey: key)
    if let data = UIImageJPEGRepresentation(image, 0.5) {
      let _ = try? data.write(to: url, options: [.atomic])
    }
  }

  private func imageURL(forKey key: String) -> URL {
    return Helpers.getDocumentsDirectory(forKey: key)
  }
}
