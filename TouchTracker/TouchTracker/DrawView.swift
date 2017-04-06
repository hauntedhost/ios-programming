//
//  DrawView.swift
//  TouchTracker
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class DrawView: UIView {

  // MARK: - Properties

  var currentLine: Line?
  var finishedLines: [Line] = []

  // MARK: UIView

  override func draw(_ rect: CGRect) {
    UIColor.black.setStroke()
    for line in finishedLines {
      stroke(line)
    }
    if let line = currentLine {
      UIColor.red.setStroke()
      stroke(line)
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first!
    let location = touch.location(in: self)
    currentLine = Line(begin: location, end: location)
    setNeedsDisplay()
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first!
    let location = touch.location(in: self)
    currentLine?.end = location
    setNeedsDisplay()
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if var line = currentLine {
      let touch = touches.first!
      let location = touch.location(in: self)
      line.end = location
      finishedLines.append(line)
    }
    currentLine = nil
    setNeedsDisplay()
  }

  // MARK: Private

  private func stroke(_ line: Line) {
    let path = UIBezierPath()
    path.lineWidth = 10
    path.lineCapStyle = .round
    path.move(to: line.begin)
    path.addLine(to: line.end)
    path.stroke()
  }
}
