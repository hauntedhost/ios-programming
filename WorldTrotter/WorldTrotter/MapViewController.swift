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
    let topConstraint =
      segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
    let leadingConstraint =
      segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailingConstraint =
      segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    topConstraint.isActive = true
    leadingConstraint.isActive = true
    trailingConstraint.isActive = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController loaded")
  }
}
