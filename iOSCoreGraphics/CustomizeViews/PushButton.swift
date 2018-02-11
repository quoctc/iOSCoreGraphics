//
//  PushButton.swift
//  iOSCoreGraphics
//
//  Created by Quoc Tran on 2/11/18.
//  Copyright © 2018 Panda. All rights reserved.
//

import UIKit

@IBDesignable
class PushButton: UIButton {
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width/2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height/2
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var lineColor: UIColor = UIColor.white
    @IBInspectable var isAddButton: Bool = false
    
    
    /// customize draw fuction to draw custom button
    ///
    /// - Parameter rect: rect of button
    override func draw(_ rect: CGRect) {
        //1. fill button with circle
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //2. add plus path
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth/2
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        
        // add first line inside the button
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        //add more line if button is plus button
        if isAddButton {
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfPlusWidth + Constants.halfPointShift))
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfPlusWidth + Constants.halfPointShift))
        }
        //stroke with color
        lineColor.setStroke()
        plusPath.stroke()
        
    }
}
