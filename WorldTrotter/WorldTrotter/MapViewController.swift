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
    view = createMapView()
    addSegmentedControl()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("MapViewController loaded")
  }

  func createMapView() -> MKMapView {
    // add map
    mapView = MKMapView()

    // TODO: set user location
    let userLocation = mapView.userLocation
    print("userLocation: \(userLocation.coordinate)")

    // let span = MKCoordinateSpanMake(20.75, 20.75)
    // let region = MKCoordinateRegion(
    //  center: userLocation.coordinate,
    //  span: span)
    //
    // mapView.setRegion(
    //   region,
    //  animated: true)

    return mapView
  }

  func addSegmentedControl() {
    // create and configure segmented control
    let segmentedControl = UISegmentedControl(items: [
      "Standard",
      "Hybrid",
      "Satellite",
    ])

    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    segmentedControl.addTarget(
      self,
      action: #selector(MapViewController.mapTypeChanged(_:)),
      for: .valueChanged)

    // add to view
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

  func mapTypeChanged(_ segControl: UISegmentedControl) {
    switch segControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .hybrid
    case 2:
      mapView.mapType = .satellite
    default:
      break
    }
  }
}
