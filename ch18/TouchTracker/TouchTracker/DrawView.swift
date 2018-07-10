//
//  DrawView.swift
//  TouchTracker
//
//  Created by USER on 2018. 7. 10..
//  Copyright © 2018년 yeongho. All rights reserved.
//

import UIKit

class DrawView: UIView {
//  var currentLine: Line?
  var currentLines = [NSValue:Line]()
  var finishedLine = [Line]()
  
  @IBInspectable var finishedLineColor: UIColor = UIColor.black {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var currentLineColor1: UIColor = UIColor.red {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var currentLineColor2: UIColor = UIColor.green {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var currentLineColor3: UIColor = UIColor.yellow {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var currentLineColor4: UIColor = UIColor.blue {
    didSet {
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var lineThickness: CGFloat = 10 {
    didSet {
      setNeedsDisplay()
    }
  }
  
  func setStrokeByAngle(line: Line) {
    let dx = line.end.x - line.begin.x
    let dy = line.end.y - line.begin.y
    if (dx > 0 && dy > 0) {
      currentLineColor1.setStroke()
    }
    else if (dx > 0 && dy < 0) {
      currentLineColor2.setStroke()
    }
    else if (dx < 0 && dy > 0) {
      currentLineColor3.setStroke()
    }
    else {
      currentLineColor4.setStroke()
    }
  }
  
  func stroke(_ line: Line) {
    let path = UIBezierPath()
    path.lineWidth = lineThickness
    path.lineCapStyle = .round
    
    path.move(to: line.begin)
    path.addLine(to: line.end)
    path.stroke()
  }
  
  override func draw(_ rect: CGRect) {
    finishedLineColor.setStroke()
    for line in finishedLine {
      stroke(line)
    }
    
    for (_, line) in currentLines {
      setStrokeByAngle(line: line)
      stroke(line)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(#function)
    for touch in touches {
      let location = touch.location(in: self)
      //    currentLine = Line(begin: location, end: location)
      let key = NSValue(nonretainedObject: touch)
      currentLines[key] = Line(begin: location, end: location)
    }
    setNeedsDisplay()
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(#function)
    for touch in touches {
      let key = NSValue(nonretainedObject: touch)
      currentLines[key]?.end = touch.location(in: self)
    }
    setNeedsDisplay()
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(#function)
    for touch in touches {
      let key = NSValue(nonretainedObject: touch)
      if var line = currentLines[key] {
        line.end = touch.location(in: self)
        finishedLine.append(line)
        currentLines.removeValue(forKey: key)
      }
    }
    setNeedsDisplay()
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print(#function)
    currentLines.removeAll()
    setNeedsDisplay()
  }
}
