//
//  ViewController.swift
//  WorldTrotter
//
//  Created by sean on 4/3/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var degreesLabelF: UILabel!
  @IBOutlet var degreesLabelC: UILabel!
  
  var temperatureF = Temperature(unit: .fahrenheit)
  var temperatureC = Temperature(unit: .celcius)

  override func viewDidLoad() {
    super.viewDidLoad()

    // addViews()

    if let degreesF = temperatureF.degrees {
      degreesLabelF.text = String(degreesF)
    }

    if let degreesC = temperatureC.degrees {
      degreesLabelC.text = String(degreesC)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func addViews() {
    let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 100)
    let firstView = UIView(frame: firstFrame)
    firstView.backgroundColor = UIColor.blue
    view.addSubview(firstView)
    
    let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
    let secondView = UIView(frame: secondFrame)
    secondView.backgroundColor = UIColor.green
    
    firstView.addSubview(secondView)
    // view.addSubview(secondView)
  }
}

