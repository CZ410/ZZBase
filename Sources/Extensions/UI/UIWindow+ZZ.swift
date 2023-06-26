//
//  UIWindow+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation
import UIKit

public extension UIWindow{
    
    /// RootViewCtroller
    static var zz_rootViewCtr: UIViewController?{
        return zz_keyWindow?.rootViewController
    }

    static func zz_getVisibleViewCtrl(_ viewCtrl: UIViewController? = nil) -> UIViewController? {
        guard let viewCtrl = viewCtrl else {
            guard let rootViewCtrl = zz_keyWindow?.rootViewController else { return nil }
            return UIWindow.zz_getVisibleViewCtrl(rootViewCtrl)
        }
        
        if viewCtrl is UINavigationController{
            guard let vc = (viewCtrl as! UINavigationController).visibleViewController else { return viewCtrl }
            guard let newVc =  UIWindow.zz_getVisibleViewCtrl(vc) else { return vc }
            if newVc.isBeingDismissed{  return vc }
            return newVc
        }else if viewCtrl is UITabBarController{
            guard let vc = (viewCtrl as! UITabBarController).selectedViewController else { return viewCtrl }
            guard let newVc =  UIWindow.zz_getVisibleViewCtrl(vc) else { return vc }
            if newVc.isBeingDismissed{ return vc }
            return newVc
        }else if (viewCtrl.children.count > 0 ){
            guard let vc = viewCtrl.children.last else { return viewCtrl }
            guard let newVc =  UIWindow.zz_getVisibleViewCtrl(vc) else { return vc }
            if newVc.isBeingDismissed{ return vc }
            return newVc
        }
        if let vc = viewCtrl.presentedViewController {
            guard let newVc =  UIWindow.zz_getVisibleViewCtrl(vc) else { return vc }
            if newVc.isBeingDismissed{ return vc }
            return newVc
        }
        return viewCtrl
    }

    /// 获取当前显示窗体
    static func zz_getCurrentViewCtrl() -> UIViewController?{
        guard var window = zz_keyWindow else { return nil }
        if window.windowLevel != .normal{
            let windows = UIApplication.shared.windows
            for subWindow in windows{
                if subWindow.windowLevel == .normal{
                    window = subWindow
                    break
                }
            }
        }
        guard let appRootViewCtrl = window.rootViewController else { return nil }
        return UIWindow.zz_getVisibleViewCtrl(appRootViewCtrl)
    }
}
