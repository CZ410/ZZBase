//
//  CGSize+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation
import UIKit

public extension CGSize{
    init(_ value: CGFloat) {
        self.init()
        self.width = value
        self.height = value
    }

    init(zz_w width: CGFloat = 0, zz_h height: CGFloat = 0) {
        self.init()
        self.width = width
        self.height = height
    }
    
    var zz_width : CGFloat {
        get {
            return self.width
        }
        set {
            self.width = newValue
        }
    }
    
    @discardableResult mutating func zz_width(_ value: CGFloat) -> Self{
        zz_width = value
        return self
    }
    
    var zz_height : CGFloat {
        get {
            return self.height
        }
        set {
            self.height = newValue
        }
    }
    
    @discardableResult mutating func zz_height(_ value: CGFloat) -> Self{
        zz_height = value
        return self
    }

    static func += (left:inout CGSize, right: CGSize){
        left.width += right.width
        left.height += right.height
    }

    static func -= (left:inout CGSize, right: CGSize){
        left.width -= right.width
        left.height -= right.height
    }

    static func + (left:CGSize, right: CGSize) -> CGSize{
        var size: CGSize = left
        size.width += right.width
        size.height += right.height
        return size
    }

    static func - (left:CGSize, right: CGSize) -> CGSize{
        var size: CGSize = left
        size.width -= right.width
        size.height -= right.height
        return size
    }
    
}
