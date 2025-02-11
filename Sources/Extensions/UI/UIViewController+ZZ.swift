//
//  UIViewController+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation
import UIKit

public extension UIViewController{
    /// NavigationController backgroundEffect
    var zz_navBarBgEffect: UIBlurEffect? {
        get {
            if #available(iOS 13.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance{
                    return standardAppearance.backgroundEffect
                }
            }
            return nil
        }
        set {
            if #available(iOS 13.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance.copy(){
                    standardAppearance.backgroundEffect = newValue
                    self.navigationController?.navigationBar.standardAppearance = standardAppearance
                    self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
                }
            }
        }
    }
    
    /// Set NavigationController backgroundEffect
    @discardableResult func zz_navBarBgEffect(_ effect: UIBlurEffect?) -> Self{
        self.zz_navBarBgEffect = effect
        return self
    }
    
    /// NavigationController backgroundColor
    var zz_navBarBgColor: UIColor? {
        get {
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance{
                    return standardAppearance.backgroundColor
                }
            }
            return self.navigationController?.navigationBar.backgroundColor
        }
        set {
            self.navigationController?.navigationBar.backgroundColor = newValue
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance.copy(){
                    standardAppearance.backgroundColor = newValue
                    self.navigationController?.navigationBar.standardAppearance = standardAppearance
                    self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
                }
            }
        }
    }
    
    /// Set NavigationController backgroundColor
    @discardableResult func zz_navBarBgColor(_ color: UIColor?) -> Self{
        self.zz_navBarBgColor = color
        return self
    }
    
    /// NavigationController BackgroundImage
    var zz_navBarBgImg: UIImage? {
        get {
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance{
                    return standardAppearance.backgroundImage
                }
            }
            return self.navigationController?.navigationBar.backgroundImage(for: UIBarMetrics.default)
        }
        set {
            self.navigationController?.navigationBar.setBackgroundImage(newValue, for: UIBarMetrics.default)
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance.copy(){
                    standardAppearance.backgroundImage = newValue
                    self.navigationController?.navigationBar.standardAppearance = standardAppearance
                    self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
                }
            }
        }
    }
    
    /// Set NavigationController BackgroundImage
    @discardableResult func zz_navBarBgImg(_ img: UIImage?) -> Self{
        self.zz_navBarBgImg = img
        return self
    }
    
    /// NavigationController ShadowImage
    var zz_shadowImag: UIImage?{
        get{
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance{
                    return standardAppearance.shadowImage
                }
            }
            return self.navigationController?.navigationBar.shadowImage
        }
        set {
            self.navigationController?.navigationBar.shadowImage = newValue
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance.copy(){
                    standardAppearance.shadowImage = newValue
                    self.navigationController?.navigationBar.standardAppearance = standardAppearance
                    self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
                }
            }
        }
    }
    
    /// Set NavigationController ShadowImage
    @discardableResult func zz_shadowImag(_ img: UIImage?) -> Self{
        self.zz_shadowImag = img
        return self
    }
    
    /// NavigationController ShadowImage
    var zz_titleColor: UIColor?{
        get {
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance{
                    return standardAppearance.titleTextAttributes[NSAttributedString.Key.foregroundColor] as? UIColor
                }
            }
            return self.navigationController?.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor
        }
        set{
            var titleAtt = self.navigationController?.navigationBar.titleTextAttributes ?? [:]
            if let color = newValue {
                titleAtt[NSAttributedString.Key.foregroundColor] = color
                self.navigationController?.navigationBar.titleTextAttributes = titleAtt
                if #available(iOS 15.0, *) {
                    if let standardAppearance = self.navigationController?.navigationBar.standardAppearance.copy(){
                        standardAppearance.titleTextAttributes = titleAtt
                        self.navigationController?.navigationBar.standardAppearance = standardAppearance
                        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
                    }
                }
            }else{
                self.navigationController?.navigationBar.titleTextAttributes?.removeValue(forKey: NSAttributedString.Key.foregroundColor)
            }
        }
    }
    
    /// Set NavigationController ShadowImage
    @discardableResult func zz_titleColor(_ color: UIColor?) -> Self{
        self.zz_titleColor = color
        return self
    }
    
    /// NavigationController TitleText Font
    var zz_titleFont: UIFont?{
        get {
            if #available(iOS 15.0, *) {
                if let standardAppearance = self.navigationController?.navigationBar.standardAppearance{
                    return standardAppearance.titleTextAttributes[NSAttributedString.Key.font] as? UIFont
                }
            }
            return self.navigationController?.navigationBar.titleTextAttributes?[NSAttributedString.Key.font] as? UIFont
        }
        set{
            var titleAtt = self.navigationController?.navigationBar.titleTextAttributes ?? [:]
            if let color = newValue {
                titleAtt[NSAttributedString.Key.font] = color
                self.navigationController?.navigationBar.titleTextAttributes = titleAtt
                if #available(iOS 15.0, *) {
                    if let standardAppearance = self.navigationController?.navigationBar.standardAppearance.copy(){
                        standardAppearance.titleTextAttributes = titleAtt
                        self.navigationController?.navigationBar.standardAppearance = standardAppearance
                        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
                    }
                }
            }else{
                self.navigationController?.navigationBar.titleTextAttributes?.removeValue(forKey: NSAttributedString.Key.font)
            }
        }
    }
    
    /// Set NavigationController TitleText Font
    @discardableResult func zz_titleFont(_ font: UIFont?) -> Self{
        self.zz_titleFont = font
        return self
    }
}

public extension UIViewController{
    func zz_push(viewCtrl:UIViewController) {
        viewCtrl.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewCtrl, animated: true)
    }
    
    func zz_pop(afterTime: Double = 0, animation: Bool = true) -> Void {
        if afterTime == 0 {
            self.navigationController?.popViewController(animated: animation)
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + afterTime) { [weak self] in
            self?.navigationController?.popViewController(animated: animation)
        }
    }
}
