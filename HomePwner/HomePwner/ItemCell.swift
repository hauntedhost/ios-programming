//
//  ItemCell.swift
//  HomePwner
//
//  Created by sean on 4/5/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var serialNumberLabel: UILabel!
  @IBOutlet var valueLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    nameLabel.adjustsFontForContentSizeCategory = true
    serialNumberLabel.adjustsFontForContentSizeCategory = true
    valueLabel.adjustsFontForContentSizeCategory = true
  }
}
