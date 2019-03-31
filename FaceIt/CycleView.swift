//
//  CycleView.swift
//  FaceIt
//
//  Created by fsc on 2019/3/31.
//  Copyright © 2019 fsc. All rights reserved.
//

import UIKit

@IBDesignable
class CycleView: UIView {
    
    public var threePercent: CGFloat = 25
    public var sixPercent: CGFloat = 10
    public var twelvePercent: CGFloat = 45
    public var twentyfourPercent: CGFloat = 20
    
    private var cycleCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private var cycleRadius: CGFloat {
        return ((bounds.height/2)-10)*0.7
    }
    
    @IBInspectable
    var threeColor: UIColor = UIColor.orange { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var sixColor: UIColor = UIColor.blue { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var twelveColor: UIColor = UIColor.black { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var twentyfourColor: UIColor = UIColor.red { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        threeColor.set()
        pathForThree().stroke()
        sixColor.set()
        pathForSix().stroke()
        twelveColor.set()
        pathForTwelve().stroke()
        twentyfourColor.set()
        pathForTwentyfour().stroke()
    }
    
    private func pathForThree() -> UIBezierPath {
        let endAngle = CGFloat.pi*(2-threePercent/50)
        let path = UIBezierPath(arcCenter: cycleCenter, radius: cycleRadius, startAngle: 0, endAngle: endAngle, clockwise: false)
        path.lineWidth = 10
        return path
    }
    
    private func pathForSix() -> UIBezierPath {
        let startAngle = CGFloat.pi*(2-threePercent/50)
        let endAngle = CGFloat.pi*((2-threePercent/50)-sixPercent/50)
        let path = UIBezierPath(arcCenter: cycleCenter, radius: cycleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.lineWidth = 10
        return path
    }
    
    private func pathForTwelve() -> UIBezierPath {
        let startAngle = CGFloat.pi*((2-threePercent/50)-sixPercent/50)
        let endAngle = CGFloat.pi*(((2-threePercent/50)-sixPercent/50)-twelvePercent/50)
        let path = UIBezierPath(arcCenter: cycleCenter, radius: cycleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.lineWidth = 10
        return path
    }
    
    private func pathForTwentyfour() -> UIBezierPath {
        let startAngle = CGFloat.pi*(((2-threePercent/50)-sixPercent/50)-twelvePercent/50)
        let endAngle = CGFloat.pi*((((2-threePercent/50)-sixPercent/50)-twelvePercent/50)-twentyfourPercent/50)
        let path = UIBezierPath(arcCenter: cycleCenter, radius: cycleRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.lineWidth = 10
        return path
    }
    
    
    
}
