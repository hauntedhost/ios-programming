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
    mapView = MKMapView()
    view = mapView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController loaded")
  }
}
