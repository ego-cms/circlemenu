//
//  CircleMenuPanGestureAnalyzer.swift
//  CircleMenu
//
//  Created by Pavel Chehov on 08/11/2018.
//

import UIKit

class CircleMenuPanGestureAnalyzer {
    private let minLenght = 30.0
    private var pointStart: CGPoint = CGPoint.zero
    private var pointEnd: CGPoint = CGPoint.zero
    private var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func getDirection(for recognizer: UIPanGestureRecognizer) -> UISwipeGestureRecognizer.Direction? {
        var heightDiff = 0.0
        var widthDiff = 0.0
        var heightDiffAbs = 0.0
        var widthDiffAbs = 0.0
        
        var verticalDirection: UISwipeGestureRecognizer.Direction?
        var horizontalDirection: UISwipeGestureRecognizer.Direction?
        var generalDirection: UISwipeGestureRecognizer.Direction?
        
        switch recognizer.state {
        case .began:
            pointStart = recognizer.location(in: view)
        case .ended:
            pointEnd = recognizer.location(in: view)
            widthDiff = Double(pointStart.x - pointEnd.x)
            widthDiffAbs = abs(widthDiff)
            if widthDiffAbs < minLenght {
                widthDiff = 0
                widthDiffAbs = 0
            }
            heightDiff = Double(pointStart.y - pointEnd.y)
            heightDiffAbs = abs(heightDiff)
            if heightDiffAbs < minLenght {
                heightDiff = 0
                heightDiffAbs = 0
            }
            if widthDiff != 0 {
                horizontalDirection = widthDiff < 0 ? .right : .left
            }
            if heightDiff != 0 {
                verticalDirection = heightDiff < 0 ? .down : .up
            }
            if widthDiffAbs != heightDiffAbs {
                generalDirection = widthDiffAbs > heightDiffAbs ? horizontalDirection : verticalDirection
            }
        default:
            break
        }
        return generalDirection
    }
}
