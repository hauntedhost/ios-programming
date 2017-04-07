//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by sean on 4/7/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

  // MARK: - Outlets

  @IBOutlet var imageView: UIImageView!
  @IBOutlet var spinner: UIActivityIndicatorView!

  // MARK: - Lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    update(with: nil)
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    update(with: nil)
  }

  // MARK: - Public API

  public func update(with image: UIImage?) {
    if let image = image {
      spinner.stopAnimating()
      imageView.image = image
    } else {
      spinner.startAnimating()
      imageView.image = nil
    }
  }
}
