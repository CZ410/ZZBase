//
//  UIControl+ZZ.swift
//  ZZToolKit
//
//  Created by 陈钟 on 2019/12/20.
//  Copyright © 2019 陈钟. All rights reserved.
//

import Foundation
import UIKit

public extension UIControl{
    class ZZUIContrlBlockTarget: NSObject {
       typealias TargetAlias = (_ sender: Any) -> Void
       var block: TargetAlias?
       var events: UIControl.Event = []

       init(block: @escaping TargetAlias, events: UIControl.Event) {
           super.init()
           self.block = block
           self.events = events
       }

       @objc
       func invoke(sender: Any){
           self.block?(sender)
       }
   }

    var zz_targets: [ZZUIContrlBlockTarget]{
        set{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "targets".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "targets".hashValue)
            let obj = objc_getAssociatedObject(self, key)
            return (obj as? [ZZUIContrlBlockTarget]) ?? []
        }
    }

    /// 添加事件
    @discardableResult func zz_addBlock(for events:UIControl.Event, block:@escaping ((_ sender: Any) -> Void)) -> Self{
        let blockTages = ZZUIContrlBlockTarget.init(block: block, events: events)
        self.addTarget(blockTages, action: #selector(blockTages.invoke(sender:)), for: events)
        self.zz_targets.append(blockTages)
        return self
    }

    @discardableResult func zz_addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self{
        self.addTarget(target, action: action, for: controlEvents)
        return self
    }

    /// 删除通过block绑定的事件
    @discardableResult func zz_removeBlockTarget(for events: UIControl.Event) -> Self{
        let eventTargets = self.zz_targets.filter({ $0.events == events })
        eventTargets.forEach { (target) in
            self.removeTarget(target, action: #selector(target.invoke(sender:)), for: target.events)
        }
        self.zz_targets.removeAll(where: { $0.events == events })
        return self
    }

    /// 删除所有的点击事件
    @discardableResult func zz_removeAllTarget() -> Self{
        self.allTargets.forEach { (obj) in
            self.removeTarget(obj, action: nil, for: UIControl.Event.allEvents)
        }
        self.zz_targets.removeAll()
        return self
    }
 
    var zz_isEnabled: Bool{
        set{
            self.isEnabled  = newValue
        }
        get{
            return self.isEnabled
        }
    }
    
    @discardableResult func zz_isEnabled(_ enable: Bool) -> Self{
        zz_isEnabled = enable
        return self
    }
    
    var zz_isSelected: Bool{
        set{
            self.isSelected  = newValue
        }
        get{
            return self.isSelected
        }
    }
    
    @discardableResult func zz_isSelected(_ selected: Bool) -> Self{
        zz_isSelected = selected
        return self
    }

}
