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

  var currentLines: [NSValue:Line] = [:]
  var finishedLines: [Line] = []

  // MARK: - IBInspectable

  @IBInspectable var finishedLineColor: UIColor = UIColor.black {
    didSet {
      setNeedsDisplay()
    }
  }

  @IBInspectable var currentLineColor: UIColor = UIColor.red {
    didSet {
      setNeedsDisplay()
    }
  }

  @IBInspectable var lineWidth: CGFloat = 10 {
    didSet {
      setNeedsDisplay()
    }
  }

  // MARK: UIResponder

  override func draw(_ rect: CGRect) {
    finishedLineColor.setStroke()
    for line in finishedLines {
      stroke(line)
    }

    currentLineColor.setStroke()
    for (_, line) in currentLines {
      stroke(line)
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let location = touch.location(in: self)
      let newLine = Line(begin: location, end: location)
      let key = touchKey(touch)
      currentLines[key] = newLine
    }
    setNeedsDisplay()
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let key = touchKey(touch)
      currentLines[key]?.end = touch.location(in: self)
    }
    setNeedsDisplay()
  }

  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    currentLines.removeAll()
    setNeedsDisplay()
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      let key = touchKey(touch)
      if var line = currentLines[key] {
        line.end = touch.location(in: self)
        finishedLines.append(line)
        currentLines.removeValue(forKey: key)
      }
    }
    setNeedsDisplay()
  }

  // MARK: Private

  private func stroke(_ line: Line) {
    let path = UIBezierPath()
    path.lineWidth = lineWidth
    path.lineCapStyle = .round
    path.move(to: line.begin)
    path.addLine(to: line.end)
    path.stroke()
  }

  private func touchKey(_ touch: UITouch) -> NSValue {
    return NSValue(nonretainedObject: touch)
  }
}
