//
//  PhotosViewController.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

  // MARK: - Properties

  var store: PhotoStore!

  // MARK: - Outlets

  @IBOutlet var imageView: UIImageView!

  // MARK: - Overrides

  override func viewDidLoad() {
    super.viewDidLoad()

    store.getPhotos()
  }
}
