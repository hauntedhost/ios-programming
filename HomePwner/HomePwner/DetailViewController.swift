//
//  DetailViewController.swift
//  HomePwner
//
//  Created by sean on 4/5/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,
  UITextFieldDelegate,
  UINavigationControllerDelegate,
  UIImagePickerControllerDelegate {

  var item: Item! {
    didSet {
      navigationItem.title = item.name
    }
  }
  var imageStore: ImageStore!

  @IBOutlet var nameField: UITextField!
  @IBOutlet var serialNumberField: UITextField!
  @IBOutlet var valueField: UITextField!
  @IBOutlet var dateLabel: UILabel!
  @IBOutlet var imageView: UIImageView!

  @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }

  @IBAction func takePicture(_ sender: UIBarButtonItem) {
    let imagePicker = UIImagePickerController()
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      imagePicker.sourceType = .camera
    } else {
      imagePicker.sourceType = .photoLibrary
    }
    imagePicker.delegate = self
    present(imagePicker, animated: true, completion: nil)
  }

  func updateItemFromFields() {
    item.name = nameField.text ?? ""
    item.serialNumber = serialNumberField.text

    if let valueText = valueField.text,
       let value = Double(valueText) {
      item.valueInDollars = value
    } else {
      item.valueInDollars = 0
    }
  }

  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [String : Any]
  ) {
    // get picked image from info dictionary
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage

    // store the image in the image store
    imageStore.setImage(image, forKey: item.itemKey)

    // put the image on the screen in the image view
    imageView.image = image

    // take image picker off the screen
    dismiss(animated: true, completion: nil)
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    view.endEditing(true)
    updateItemFromFields()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    nameField.text = item.name
    serialNumberField.text = item.serialNumber
    valueField.text = Helpers.numberFormatter.string(
      from: NSNumber(value: item.valueInDollars)
    )
    dateLabel.text = Helpers.dateFormatter.string(from: item.dateCreated)
    imageView.image = imageStore.image(forKey: item.itemKey)
  }
}
