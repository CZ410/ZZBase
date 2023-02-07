//
//  UILabel+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation
import UIKit

public extension UILabel{
    
    convenience init(text: String?, font: UIFont? = nil, textColor: UIColor? = nil , alignment: NSTextAlignment = .left){
        self.init()
        self.text = text
        if let font = font {
            self.font = font
        }
        if let textColor = textColor {
            self.textColor = textColor
        }
        self.textAlignment = alignment
    }

    @discardableResult func zz_text(_ text: String?, lineHeight: CGFloat) -> Self{
        let pla = NSMutableParagraphStyle()
        pla.lineSpacing = lineHeight
        pla.lineBreakMode = self.lineBreakMode
        pla.alignment = self.textAlignment
        
        let muatt = NSMutableAttributedString(string: text ?? "")
        muatt.addAttribute(NSAttributedString.Key.paragraphStyle,
                           value: pla,
                           range: NSRange(location: 0, length: muatt.length))
        self.attributedText = muatt
        return self
    }

    @discardableResult func zz_text(_ text: String?) -> Self{
        self.text = text
        return self
    }
    
    @discardableResult func zz_attributedText(_ attributedText: NSAttributedString) -> Self{
        self.attributedText = attributedText
        return self
    }
    
    @discardableResult func zz_font(_ font: UIFont) -> Self{
        self.font = font
        return self
    }
    
    @discardableResult func zz_textColor(_ textColor: UIColor) -> Self{
        self.textColor = textColor
        return self
    }
    
    @discardableResult func zz_shadowColor(_ shadowColor: UIColor?) -> Self{
        self.shadowColor = shadowColor
        return self
    }
    
    @discardableResult func zz_shadowOffset(_ shadowOffset: CGSize) -> Self{
        self.shadowOffset = shadowOffset
        return self
    }
    
    @discardableResult func zz_textAlignment(_ textAlignment: NSTextAlignment) -> Self{
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult func zz_lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self{
        self.lineBreakMode = lineBreakMode
        return self
    }
    
    @discardableResult func zz_highlightedTextColor(_ highlightedTextColor: UIColor?) -> Self{
        self.highlightedTextColor = highlightedTextColor
        return self
    }
    
    @discardableResult func zz_isHighlighted(_ highlighted: Bool) -> Self{
        self.isHighlighted = highlighted
        return self
    }
    
//    @discardableResult func zz_isUserInteractionEnabled(_ userInteractionEnabled: Bool) -> Self{
//        self.isUserInteractionEnabled = userInteractionEnabled
//        return self
//    }
    
    @discardableResult func zz_isEnabled(_ enabled: Bool) -> Self{
        self.isEnabled = enabled
        return self
    }
    
    @discardableResult func zz_numberOfLines(_ numberOfLines: Int) -> Self{
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult func zz_adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self{
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    
    @discardableResult func zz_baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self{
        self.baselineAdjustment = baselineAdjustment
        return self
    }
    
    @discardableResult func zz_minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self{
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult func zz_allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self{
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    
    @available(iOS 14.0, *)
    @discardableResult func zz_lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self{
        self.lineBreakStrategy = lineBreakStrategy
        return self
    }
    
    @discardableResult func zz_preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self{
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
    
    @discardableResult func zz_showsExpansionTextWhenTruncated(_ showsExpansionTextWhenTruncated: Bool) -> Self{
        self.showsExpansionTextWhenTruncated = showsExpansionTextWhenTruncated
        return self
    }
    
}
