//
//  UIViewExtension.swift
//  CircleMenu
//
//  Created by Pavel Chehov on 13/11/2018.
//

import UIKit

extension CGRect {
    mutating func resize(x: Double? = nil, y: Double? = nil, width: Double? = nil, height: Double? = nil) {
        let origin = self.origin
        self = CGRect(x: x ?? Double(origin.x), y: y ?? Double(origin.y), width: width ?? Double(self.width), height: height ?? Double(self.height))
    }
    
    mutating func resize(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        self = CGRect(x: x ?? origin.x, y: y ?? origin.y, width: width ?? self.width, height: height ?? self.height)
    }
}
