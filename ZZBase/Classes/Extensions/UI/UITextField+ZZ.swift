//
//  UITextField+ZZ.swift
//  ZZBase
//
//  Created by 123 on 2021/1/7.
//

import Foundation
import UIKit

//MARK: - Sys Values
public extension UITextField{
    // default is nil
    var zz_text: String?{
        get {
            return self.text
        }
        set {
            self.text = newValue
        }
    }
    
    @discardableResult func zz_text(_ v: String?) -> Self{
        zz_text = v
        return self
    }
    
    // default is nil
    var zz_attributedText: NSAttributedString?{
        get { return self.attributedText }
        set { self.attributedText = newValue }
    }
    
    @discardableResult func zz_attributedText(_ v: NSAttributedString?) -> Self{
        zz_attributedText = v
        return self
    }
    
    // default is nil. use opaque black
    var zz_textColor: UIColor?{
        get { return self.textColor }
        set { self.textColor = newValue }
    }
    
    @discardableResult func zz_textColor(_ v: UIColor?) -> Self{
        zz_textColor = v
        return self
    }
    
    // default is nil. use system font 12 pt
    var zz_font: UIFont?{
        get { return self.font }
        set { self.font = newValue }
    }
    
    @discardableResult func zz_font(_ v: UIFont?) -> Self{
        zz_font = v
        return self
    }
    
    // default is NSLeftTextAlignment
    var zz_textAlignment: NSTextAlignment{
        get { return self.textAlignment }
        set { self.textAlignment = newValue }
    }
    
    @discardableResult func zz_textAlignment(_ v: NSTextAlignment) -> Self{
        zz_textAlignment = v
        return self
    }
    
    // default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.
    var zz_borderStyle: UITextField.BorderStyle{
        get { return self.borderStyle }
        set { self.borderStyle = newValue }
    }
    
    @discardableResult func zz_borderStyle(_ v: UITextField.BorderStyle) -> Self{
        zz_borderStyle = v
        return self
    }
    
    @available(iOS 7.0, *)  // applies attributes to the full range of text. Unset attributes act like default values.
    var zz_defaultTextAttributes: [NSAttributedString.Key : Any]{
        get { return self.defaultTextAttributes }
        set { self.defaultTextAttributes = newValue }
    }
    
    @discardableResult func zz_defaultTextAttributes(_ v: [NSAttributedString.Key : Any]) -> Self{
        zz_defaultTextAttributes = v
        return self
    }
    
    // default is nil. string is drawn 70% gray
    var zz_placeholder: String?{
        get { return self.placeholder }
        set { self.placeholder = newValue }
    }
    
    @discardableResult func zz_placeholder(_ v: String?) -> Self{
        zz_placeholder = v
        return self
    }
    
    @available(iOS 6.0, *)  // default is nil
    var zz_attributedPlaceholder: NSAttributedString?{
        get { return self.attributedPlaceholder }
        set { self.attributedPlaceholder = newValue }
    }
    
    @discardableResult func zz_attributedPlaceholder(_ v: NSAttributedString?) -> Self{
        zz_attributedPlaceholder = v
        return self
    }
    
    // default is NO which moves cursor to location clicked. if YES, all text cleared
    var zz_clearsOnBeginEditing: Bool{
        get { return self.clearsOnBeginEditing }
        set { self.clearsOnBeginEditing = newValue }
    }
    
    @discardableResult func zz_clearsOnBeginEditing(_ v: Bool) -> Self{
        zz_clearsOnBeginEditing = v
        return self
    }
    
    // default is NO. if YES, text will shrink to minFontSize along baseline
    var zz_adjustsFontSizeToFitWidth: Bool{
        get { return self.adjustsFontSizeToFitWidth }
        set { self.adjustsFontSizeToFitWidth = newValue }
    }
    
    @discardableResult func zz_adjustsFontSizeToFitWidth(_ v: Bool) -> Self{
        zz_adjustsFontSizeToFitWidth = v
        return self
    }
    
    // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES
    var zz_minimumFontSize: CGFloat{
        get { return self.minimumFontSize }
        set { self.minimumFontSize = newValue }
    }
    
    @discardableResult func zz_minimumFontSize(_ v: CGFloat) -> Self{
        zz_minimumFontSize = v
        return self
    }
    
    // default is nil. weak reference
    weak var zz_delegate: UITextFieldDelegate?{
        get { return self.delegate }
        set { self.delegate = newValue }
    }
    
    @discardableResult func zz_delegate(_ v: UITextFieldDelegate) -> Self{
        zz_delegate = v
        return self
    }
    
    // default is nil. draw in border rect. image should be stretchable
    var zz_background: UIImage?{
        get { return self.background }
        set { self.background = newValue }
    }
    
    @discardableResult func zz_background(_ v: UIImage) -> Self{
        zz_background = v
        return self
    }
    
    // default is nil. ignored if background not set. image should be stretchable
    var zz_disabledBackground: UIImage?{
        get { return self.disabledBackground }
        set { self.disabledBackground = newValue }
    }
    
    @discardableResult func zz_disabledBackground(_ v: UIImage) -> Self{
        zz_disabledBackground = v
        return self
    }
    
    
    var zz_isEditing: Bool{
        get { return self.isEditing }
    }
    
    @available(iOS 6.0, *) // default is NO. allows editing text attributes with style operations and pasting rich text
    var zz_allowsEditingTextAttributes: Bool{
        get { return self.allowsEditingTextAttributes }
        set { self.allowsEditingTextAttributes = newValue }
    }
    
    @discardableResult func zz_allowsEditingTextAttributes(_ v: Bool) -> Self{
        zz_allowsEditingTextAttributes = v
        return self
    }
    
    @available(iOS 6.0, *) // automatically resets when the selection changes
    var zz_typingAttributes: [NSAttributedString.Key : Any]?{
        get { return self.typingAttributes }
        set { self.typingAttributes = newValue }
    }
    
    @discardableResult func zz_typingAttributes(_ v: [NSAttributedString.Key : Any]?) -> Self{
        zz_typingAttributes = v
        return self
    }
    
    
    // You can supply custom views which are displayed at the left or right
    // sides of the text field. Uses for such views could be to show an icon or
    // a button to operate on the text in the field in an application-defined
    // manner.
    //
    // A very common use is to display a clear button on the right side of the
    // text field, and a standard clear button is provided.
    
    // sets when the clear button shows up. default is UITextFieldViewModeNever
    var zz_clearButtonMode: UITextField.ViewMode{
        get { return self.clearButtonMode }
        set { self.clearButtonMode = newValue }
    }
    
    @discardableResult func zz_clearButtonMode(_ v: UITextField.ViewMode) -> Self{
        zz_clearButtonMode = v
        return self
    }
    
    // e.g. magnifying glass
    var zz_leftView: UIView?{
        get { return self.leftView }
        set { self.leftView = newValue }
    }
    
    @discardableResult func zz_leftView(_ v: UIView?) -> Self{
        zz_leftView = v
        return self
    }
    
    // sets when the left view shows up. default is UITextFieldViewModeNever
    var zz_leftViewMode: UITextField.ViewMode{
        get { return self.leftViewMode }
        set { self.leftViewMode = newValue }
    }
    
    @discardableResult func zz_leftViewMode(_ v: UITextField.ViewMode) -> Self{
        zz_leftViewMode = v
        return self
    }
    
    // e.g. bookmarks button
    var zz_rightView: UIView?{
        get { return self.rightView }
        set { self.rightView = newValue }
    }
    
    @discardableResult func zz_rightView(_ v: UIView?) -> Self{
        zz_rightView = v
        return self
    }
    
    var zz_rightViewMode: UITextField.ViewMode{
        get { return self.rightViewMode }
        set { self.rightViewMode = newValue }
    }
    
    @discardableResult func zz_rightViewMode(_ v: UITextField.ViewMode) -> Self{
        zz_rightViewMode = v
        return self
    }
}


//MARK: - ClearButtonBlock
public extension UITextField{
    var zz_clearBlock: ((UITextField) -> ())?{
        set{
            zz_objc_set(key: "zz_clearBlock", newValue)
        }
        get{
            return zz_objc_get(key: "zz_clearBlock", ((UITextField) -> ()).self)
        }
    }
    
    @discardableResult func zz_clearBlock(_ v: ((UITextField) -> ())?) -> Self{
        zz_clearBlock = v
        return self
    }
    
    var zz_clearButtonImage: UIImage?{
        set {
            zz_objc_set(key: "zz_clearButtonImage", newValue)
            setModifyClearButton()
        }
        get { return zz_objc_get(key: "zz_clearButtonImage", UIImage.self) }
    }
    
    func zz_clearButtonImage(_ v: UIImage?) -> Self{
        zz_clearButtonImage = v
        return self
    }
    
    private func setModifyClearButton() {
        guard let image = self.zz_clearButtonImage else {
            self.rightView = nil
            self.rightViewMode = .never
            return
        }
        let view = UIView(frame: CGRect(origin: .zero, size: image.size))
        self.rightView = view
        self.rightViewMode = .whileEditing
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(image, for: .normal)
        
        view.addSubview(clearButton)
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: view.topAnchor),
            clearButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            clearButton.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
    }
    
    /// 点击清除按钮，清空内容
    @objc private func clear(sender : AnyObject) {
        self.text = ""
        self.zz_clearBlock?(self)
    }
}
