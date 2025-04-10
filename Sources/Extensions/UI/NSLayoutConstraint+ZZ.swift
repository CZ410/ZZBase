//
//  NSLayoutConstraint+ZZ.swift
//  Pods
//
//  Created by 陈钟 on 2025/4/9.
//


public extension NSLayoutConstraint {
    /**
     改变multiplier约束
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func zz_multiplier(_ multiplier:CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
