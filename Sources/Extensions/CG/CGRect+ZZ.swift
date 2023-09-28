//
//  CGRect+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation

public extension CGRect{
    
    init(zz_x: CGFloat = 0, zz_y: CGFloat = 0, zz_w: CGFloat = 0, zz_h: CGFloat = 0) {
        self.init()
        self.origin.x = zz_x
        self.origin.y = zz_y
        self.size.width = zz_w
        self.size.height = zz_h
    }
    
    var zz_x : CGFloat {
        get {
            return self.origin.x
        }
        set {
            self.origin.x = newValue
        }
    }
    
    @discardableResult mutating func zz_x(_ value: CGFloat) -> Self{
        zz_x = value
        return self
    }
    
    var zz_y : CGFloat {
        get {
            return self.origin.y
        }
        set {
            self.origin.y = newValue
        }
    }
    
    @discardableResult mutating func zz_y(_ value: CGFloat) -> Self{
        zz_y = value
        return self
    }
    
    var zz_width : CGFloat {
        get {
            return self.size.width
        }
        set {
            self.size.width = newValue
        }
    }
    
    @discardableResult mutating func zz_width(_ value: CGFloat) -> Self{
        zz_width = value
        return self
    }
    
    var zz_height : CGFloat {
        get {
            return self.size.height
        }
        set {
            self.size.height = newValue
        }
    }
    
    @discardableResult mutating func zz_height(_ value: CGFloat) -> Self{
        zz_height = value
        return self
    }

    static func zz_all(_ v: CGFloat) -> CGRect{
        return CGRect(x: v, y: v, width: v, height: v)
    }

    static func zz_only(x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0)  -> CGRect{
        return CGRect(x: x, y: y, width: width, height: height)
    }
}

public extension CGRect{
    static func += (left:inout CGRect, right: CGRect){
        left.zz_x += right.zz_x
        left.zz_y += right.zz_y
        left.zz_width += right.zz_width
        left.zz_height += right.zz_height
    }

    static func -= (left:inout CGRect, right: CGRect){
        left.zz_x -= right.zz_x
        left.zz_y -= right.zz_y
        left.zz_width -= right.zz_width
        left.zz_height -= right.zz_height
    }

    static func + (left:CGRect, right: CGRect) -> CGRect{
        var size: CGRect = left
        size.zz_x += right.zz_x
        size.zz_y += right.zz_y
        size.zz_width += right.zz_width
        size.zz_height += right.zz_height
        return size
    }

    static func - (left:CGRect, right: CGRect) -> CGRect{
        var size: CGRect = left
        size.zz_x -= right.zz_x
        size.zz_y -= right.zz_y
        size.zz_width -= right.zz_width
        size.zz_height -= right.zz_height
        return size
    }
}
