//
//  UIEdgeInsets+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import UIKit

public extension UIEdgeInsets{
    
    init(zz_top: CGFloat = 0, zz_left: CGFloat = 0, zz_bottom: CGFloat = 0, zz_right: CGFloat = 0) {
        self.init()
        self.top = zz_top
        self.left = zz_left
        self.bottom = zz_bottom
        self.right = zz_right
    }
    
    var zz_top : CGFloat {
        get {
            return self.top
        }
        set {
            self.top = newValue
        }
    }
    
    @discardableResult mutating func zz_top(_ value: CGFloat) -> Self{
        zz_top = value
        return self
    }
    
    var zz_left : CGFloat {
        get {
            return self.left
        }
        set {
            self.left = newValue
        }
    }
    
    @discardableResult mutating func zz_left(_ value: CGFloat) -> Self{
        zz_left = value
        return self
    }
    
    var zz_bottom : CGFloat {
        get {
            return self.bottom
        }
        set {
            self.bottom = newValue
        }
    }
    
    @discardableResult mutating func zz_bottom(_ value: CGFloat) -> Self{
        zz_bottom = value
        return self
    }
    
    var zz_right : CGFloat {
        get {
            return self.right
        }
        set {
            self.right = newValue
        }
    }
    
    @discardableResult mutating func zz_right(_ value: CGFloat) -> Self{
        zz_right = value
        return self
    }

    static func zz_all(_ v: CGFloat) -> UIEdgeInsets{
        return UIEdgeInsets(top: v, left: v, bottom: v, right: v)
    }

    static func zz_only(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0)  -> UIEdgeInsets{
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    func zz_copy(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> UIEdgeInsets{
        return UIEdgeInsets(top: top ?? self.top, left: left ?? self.left, bottom: bottom ?? self.bottom, right: right ?? self.right)
    }
}

public extension UIEdgeInsets{
    static func += (left:inout UIEdgeInsets, right: UIEdgeInsets){
        left.zz_top += right.zz_top
        left.zz_left += right.zz_left
        left.zz_bottom += right.zz_bottom
        left.zz_right += right.zz_right
    }

    static func -= (left:inout UIEdgeInsets, right: UIEdgeInsets){
        left.zz_top -= right.zz_top
        left.zz_left -= right.zz_left
        left.zz_bottom -= right.zz_bottom
        left.zz_right -= right.zz_right
    }

    static func + (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets{
        var size: UIEdgeInsets = left
        size.zz_top += right.zz_top
        size.zz_left += right.zz_left
        size.zz_bottom += right.zz_bottom
        size.zz_right += right.zz_right
        return size
    }

    static func - (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets{
        var size: UIEdgeInsets = left
        size.zz_top -= right.zz_top
        size.zz_left -= right.zz_left
        size.zz_bottom -= right.zz_bottom
        size.zz_right -= right.zz_right
        return size
    }
}
