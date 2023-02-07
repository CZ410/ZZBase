//
//  UIAlertController+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation
import UIKit

public extension UIAlertController{
    
    @discardableResult static func show(actions:[UIAlertAction],
                      viewCtrl:UIViewController,
                      view:UIView?,
                      title:String?,
                      message:String?,
                      style:UIAlertController.Style) -> UIAlertController{
        let alertCtrl = UIAlertController.init(title: title, message: message, preferredStyle: style)
        if view != nil {
            let popover = alertCtrl.popoverPresentationController
            popover?.sourceView = view
            popover?.sourceRect = view!.bounds
            popover?.permittedArrowDirections = .any
        }
        for action in actions {
            alertCtrl.addAction(action)
        }
        viewCtrl.present(alertCtrl, animated: true, completion: nil)
        return alertCtrl
    }

    
    /// 显示一个系统Alert弹窗
    /// - Parameters:
    ///   - alert: 自定义UIAlertAction对象数组
    ///   - viewCtrl: presentViewController
    ///   - view: 显示位置
    ///   - title: 标题
    ///   - message: 内容
    static func show(alert:[UIAlertAction],
                     viewCtrl:UIViewController,
                     view:UIView?,
                     title:String?,
                     message:String?){
        self.show(actions: alert,
                  viewCtrl: viewCtrl,
                  view: view,
                  title: title,
                  message: message,
                  style: .alert)
    }

    
    /// 显示一个系统Alert弹窗
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - okTitle: 确定标题
    ///   - handler: 取消标题
    static func show(alert title: String?, message: String?, okTitle: String?, handler: ((UIAlertAction) -> Void)? = nil){
        guard let currVc = UIWindow.zz_getCurrentViewCtrl() else { return }
        let ok = UIAlertAction(title: okTitle, style: .default, handler: handler)
        self.show(alert: [ok], viewCtrl: currVc, view: currVc.view, title: title, message: message)
    }
    
    /// 展示一个系统ActionSheet
    /// - Parameters:
    ///   - actionSheet: UIAlertAction对象数组
    ///   - viewCtrl: presentViewController
    ///   - view: 显示位置
    ///   - title: 标题
    ///   - message: 内容
    static func show(actionSheet:[UIAlertAction],
                     viewCtrl:UIViewController,
                     view:UIView?,
                     title:String?,
                     message:String?){
        self.show(actions: actionSheet,
                  viewCtrl: viewCtrl,
                  view: view,
                  title: title,
                  message: message,
                  style: .actionSheet)
    }
    
    /// 展示一个系统弹窗
    /// - Parameters:
    ///   - titles: 按钮titles对象数据
    ///   - viewCtrl: presentViewController
    ///   - view: 显示位置
    ///   - title: 标题
    ///   - message: 内容
    ///   - style: 样式
    ///   - titleBlock: titles回调 自行处理 titles中对象需要内显示的title
    ///   - clickBlock: 选项按钮点击调用
    static func showT<T>(titles:[T],
                         viewCtrl:UIViewController,
                         view:UIView?,
                         title:String?,
                         message:String?,
                         style:UIAlertController.Style,
                         titleBlock:((_ obj:T) -> String?),
                         clickBlock:@escaping (_ alertAction:UIAlertAction,_ index:Int,_ obj:T) -> Void){
        var actions: [UIAlertAction] = []
        for index in 0 ..< titles.count {
            let titleObj = titles[index]
            let titleStr = titleBlock(titleObj)
            let alert = UIAlertAction.init(title: titleStr, style: .default) { (alertAction) in
                clickBlock(alertAction,index,titleObj)
            }
            actions.append(alert)
        }
        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        actions.append(cancelAction)
        self.show(actions: actions,
                  viewCtrl: viewCtrl,
                  view: view,
                  title: title,
                  message: message,
                  style: style)
    }
    
    /// 展示一个系统弹窗
    /// - Parameters:
    ///   - titles: 按钮titles对象数据
    ///   - viewCtrl: presentViewController
    ///   - view: 显示位置
    ///   - title: 标题
    ///   - message: 内容
    ///   - style: 样式
    ///   - titleBlock: titles回调 自行处理 titles中对象需要内显示的title
    ///   - clickBlock: 选项按钮点击调用
    static func show(titles:[Any],
                     viewCtrl:UIViewController,
                     view:UIView?,
                     title:String?,
                     message:String?,
                     style:UIAlertController.Style,
                     titleBlock:((_ obj:Any) -> String?),
                     clickBlock:@escaping (_ alertAction:UIAlertAction,_ index:Int,_ obj:Any) -> Void){
        self.showT(titles: titles, viewCtrl: viewCtrl, view: view, title: title, message: message, style: style, titleBlock: titleBlock, clickBlock: clickBlock)
    }

    /// 弹出Alert 无按钮框
    /// - Parameters:
    ///   - showTime: 当为nil时不自动隐藏  默认2s后自动关闭
    @discardableResult static func alert(from viewCtrl: UIViewController, title: String? = nil , message: String? = nil, showTime: TimeInterval? = 2) -> UIAlertController{
        let alertCtrl = self.show(actions: [], viewCtrl: viewCtrl, view: nil, title: title, message: message, style: .alert)
        guard let time = showTime else { return alertCtrl}
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            alertCtrl.dismiss(animated: true, completion: nil)
        }
        return alertCtrl
    }
    
}
