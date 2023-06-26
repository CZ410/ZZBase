//
//  AttributedString+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation
import UIKit

public extension NSAttributedString{

    /// 计算富文本的Size
    /// - Parameters:
    ///   - font: 字体
    ///   - maxSize: maxSize >= 计算完成的Size；
    ///   - lineHeight: 行高
    ///   - line: 显示的行数
    /// - Returns: Size
    func zz_textSize(font: UIFont? = nil, maxSize: CGSize, lineHeight: CGFloat? = nil, line: Int = 0) -> CGSize{
        let muAtt = NSMutableAttributedString(attributedString: self)

        if let lineHeight = lineHeight{
            let pla = NSMutableParagraphStyle()
            pla.lineSpacing = lineHeight
            muAtt.addAttribute(NSAttributedString.Key.paragraphStyle, value: pla, range: NSRange(location: 0, length: muAtt.length))
        }
        
        let label = UILabel(frame: CGRect(origin: .zero, size: maxSize))
        label.numberOfLines = line
        if let font = font { label.font = font }
        label.attributedText = muAtt
        label.sizeToFit()
        
        var frame = label.frame
        if frame.zz_width > maxSize.width{
            frame.zz_width = maxSize.width
        }
        return frame.size
    }
}
