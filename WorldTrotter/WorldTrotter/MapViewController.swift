//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by sean on 4/4/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  var mapView: MKMapView!

  override func loadView() {
    // add map
    mapView = MKMapView()
    view = mapView

    // add segmented control
    let segmentedControl = UISegmentedControl(items: [
      "Standard",
      "Hybrid",
      "Satellite",
    ])
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    view.addSubview(segmentedControl)

    // add control constraints
    let margins = view.layoutMarginsGuide
    let topConstraint = segmentedControl.topAnchor.constraint(
      equalTo: topLayoutGuide.bottomAnchor,
      constant: 8)
    let leadingConstraint = segmentedControl.leadingAnchor.constraint(
      equalTo: margins.leadingAnchor)
    let trailingConstraint = segmentedControl.trailingAnchor.constraint(
      equalTo: margins.trailingAnchor)
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController loaded")
  }
}
