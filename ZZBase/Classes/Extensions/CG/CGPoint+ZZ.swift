//
//  CGPoint+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation
import UIKit

public extension CGPoint{
    init(_ value: CGFloat) {
        self.init()
        self.x = value
        self.y = value
    }

    init(zz_x: CGFloat = 0, zz_y: CGFloat = 0) {
        self.init()
        self.x = zz_x
        self.y = zz_y
    }
    
    var zz_x : CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }
    
    @discardableResult mutating func zz_x(_ value: CGFloat) -> Self{
        zz_x = value
        return self
    }
    
    var zz_y : CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    @discardableResult mutating func zz_y(_ value: CGFloat) -> Self{
        zz_y = value
        return self
    }
    

    static func += (left:inout CGPoint, right: CGPoint){
        left.x += right.x
        left.y += right.y
    }

    static func -= (left:inout CGPoint, right: CGPoint){
        left.x -= right.x
        left.y -= right.y
    }

    static func + (left:CGPoint, right: CGPoint) -> CGPoint{
        var size: CGPoint = left
        size.x += right.x
        size.y += right.y
        return size
    }

    static func - (left:CGPoint, right: CGPoint) -> CGPoint{
        var size: CGPoint = left
        size.x -= right.x
        size.y -= right.y
        return size
    }
}
