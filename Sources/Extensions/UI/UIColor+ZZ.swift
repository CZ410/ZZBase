//
//  Color+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/29.
//

import Foundation
import UIKit

public extension UIColor{
    var r: CGFloat{
        return zz_rgba().r
    }
    
    var g: CGFloat{
        return zz_rgba().g
    }
    
    var b: CGFloat{
        return zz_rgba().b
    }
    
    var a: CGFloat{
        return zz_rgba().a
    }
    
    
    /// 暗黑模式颜色
    /// - Parameters:
    ///   - light: 一般模式的颜色
    ///   - dark: 暗黑模式下的颜色
    /// - Returns: 适配暗黑模式的颜色
    static func zz_darkColor(_ light: UIColor,_ dark: UIColor) -> UIColor{
       if #available(iOS 13, *) {
           return UIColor.init { (traitCollection) -> UIColor in
               if traitCollection.userInterfaceStyle == .light{
                   return light
               }else{
                   return dark
               }
           }
       } else {
           return light
       }
   }
    
    
    /// Color RGB
    static func zz_rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor{
        return UIColor.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    /// HEXColor
    static func zz_hex(_ hexStr: String, alpha: CGFloat = 1) -> UIColor{
        var cString = hexStr.trimmingCharacters(in: CharacterSet.whitespaces).uppercased()
        if (cString.count < 6){
            return UIColor.clear
        }
        if (cString.hasPrefix("0X")) {
            cString = cString.zz_sub(from: 2)
        }
        if (cString.hasPrefix("#")) {
            cString = cString.zz_sub(from: 1)
        }
        if cString.count != 6 {
            return UIColor.clear
        }
        var range = NSRange(location: 0, length: 2)
        
        //R
        let rString = cString.zz_sub(range: range)
        //G
        range.location = 2
        let gString = cString.zz_sub(range: range)
        //B
        range.location = 4
        let bString = cString.zz_sub(range: range)
        
        var r:CUnsignedLongLong = 0, g:CUnsignedLongLong = 0, b:CUnsignedLongLong = 0;

        Scanner.init(string: rString).scanHexInt64(&r)
        Scanner.init(string: gString).scanHexInt64(&g)
        Scanner.init(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    ///  获取颜色的RGB
    func zz_rgba() -> (r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) {
        var red = CGFloat()
        var green = CGFloat()
        var blue = CGFloat()
        var alpha = CGFloat()
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return(red,green,blue,alpha)
    }
    
    /// 修改颜色的透明度
    func zz_alpha(_ alpha: CGFloat) -> UIColor{
        return .zz_alpha(self, alpha: alpha)
    }
    
    /// 修改颜色的透明度
    static func zz_alpha(_ color: UIColor, alpha: CGFloat) -> UIColor{
        let rgb = color.zz_rgba()
        return UIColor(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: alpha)
    }
    
    /// 过渡颜色到指定颜色
    /// - Parameters:
    ///   - color: 指定颜色
    ///   - progress: 过度进度  值：0～1
    /// - Returns: 过渡颜色
    func zz_transition(to color: UIColor, progress: CGFloat) -> UIColor {
        let red = self.r + (color.r - self.r) * progress
        let green = self.g + (color.g - self.g) * progress
        let blue = self.b + (color.b - self.b) * progress
        let alpha = self.a + (color.a - self.a) * progress
        let resultColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return resultColor
    }
    
    /// 生成一个随机色
    /// - Returns: 随机色
    static func zz_random() -> UIColor {
        let r = arc4random() % 255
        let g = arc4random() % 255
        let b = arc4random() % 255
        
        let red = CGFloat(r)/255.0
        let green = CGFloat(g)/255.0
        let blue = CGFloat(b)/255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
