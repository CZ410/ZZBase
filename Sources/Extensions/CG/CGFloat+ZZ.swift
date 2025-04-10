//
//  CGFloat+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation

public extension Int{
    var zz_formatter: String{
        if self > 10000{
            let value = Double(self) / 10000.0
            return value.zz_toPoint(2).appending("w")
        }
        if self > 1000{
            let value = Double(self) / 1000.0
            return value.zz_toPoint(2).appending("k")
        }
        return "\(self)"
    }
    
    func zz_toString(minCount: Int) -> String{
        var str = "\(self)"
        if str.count > minCount{
            return str
        }
        while str.count < minCount {
            str.insert("0", at: str.startIndex)
        }
        return str
    }
}

public extension CGFloat{
    static let zz_max = CGFLOAT_MAX
}

public extension Double{
    static let zz_max = CGFLOAT_MAX
    
    /// 转成字符串 保留小数point位数
    /// - Parameters:
    ///   - point: 需要保留的小数位数
    ///   - isClearLastZero: 是否清楚末尾0
    /// - Returns: 保留小数位数的字符串
    func zz_toPoint(_ pointCount: Int, isClearLastZero: Bool = true) -> String{
        var str = String(format: "%.\(pointCount)f", self)
        guard isClearLastZero else {  return str }
        while true {
            if str.zz_last.zz_intValue == 0 && str.zz_last != "."{
                str = str.zz_sub(to: str.count - 1)
                continue
            }
            break
        }
        if str.zz_last == "."{
            str = str.zz_sub(to: str.count - 1)
        }
        return str
    }
}
