//
//  CircleButtonIndicator.swift
//  CircleMenu
//
//  Created by Pavel Chehov on 08/11/2018.
//

import UIKit

class CircleButtonIndicator: UIView {
    static let size:Double = 6
    private var oldPosition: CGPoint = CGPoint.zero
    
    var position: CGPoint = CGPoint.zero {
        didSet {
            oldPosition = position
            frame = CGRect(x: position.x, y: position.y, width: CGFloat(CircleButtonIndicator.size), height: CGFloat(CircleButtonIndicator.size))
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor
        isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.cornerRadius = bounds.height / 2
    }
    
    func resetPosition() {
        position = oldPosition
    }
}
