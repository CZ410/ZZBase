//
//  CALayer+ZZ.swift
//  ZZToolKit
//
//  Created by 陈钟 on 2019/12/27.
//  Copyright © 2019 陈钟. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

//MARK: - Frame
public extension CALayer{
    /// 删除所有的子Layer
    func zz_removeAllSubLayers(){
        while (self.sublayers?.count ?? 0) > 0 {
            self.sublayers?.last?.removeFromSuperlayer()
        }
    }
    
    var zz_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var selfFrame = self.frame
            selfFrame.origin.x = CGFloat(newValue)
            self.frame = selfFrame
        }
    }
    
    var zz_y : CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var selfFrame = self.frame
            selfFrame.origin.y = CGFloat(newValue)
            self.frame = selfFrame
        }
    }
    
    var zz_width : CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var selfFrame = self.frame
            selfFrame.size.width = CGFloat(newValue)
            self.frame = selfFrame
        }
    }
    
    var zz_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var selfFrame = self.frame
            selfFrame.size.height = CGFloat(newValue)
            self.frame = selfFrame
        }
    }
    
    var zz_maxX: CGFloat {
        get {
            return self.frame.size.width + self.frame.origin.x
        }
    }
    
    var zz_maxY: CGFloat {
        get {
            return self.frame.size.height + self.frame.origin.y
        }
    }
    
    var zz_size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var selfFrame = self.frame
            selfFrame.size = newValue
            self.frame = selfFrame
        }
    }
    
    var zz_origin : CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var selfFrame = self.frame
            selfFrame.origin = newValue
            self.frame = selfFrame
        }
    }
    
    var zz_center: CGPoint{
        set{
            var frame = self.frame
            frame.origin.x = newValue.x - frame.size.width * 0.5
            frame.origin.y = newValue.y - frame.size.height * 0.5
            self.frame = frame
        }
        get{
            return CGPoint(x: self.frame.zz_x + self.frame.width * 0.5,
                           y: self.frame.zz_y + self.frame.height + 0.5)
        }
    }
    
    var zz_centerX: CGFloat {
        get {
            return zz_center.x
        }
        set {
            var center = self.zz_center
            center.x = newValue
            zz_center = center
        }
    }
    
    var zz_centerY: CGFloat {
        get {
            return zz_center.y
        }
        set {
            var center = zz_center
            center.y = newValue
            zz_center = center
        }
    }

    var zz_frame: CGRect {
        get {
            return self.frame
        }
        set {
            self.frame = newValue
        }
    }

    var zz_bounds: CGRect {
        get {
            return self.bounds
        }
        set {
            self.bounds = newValue
        }
    }
}

public extension CALayer{

    @discardableResult func zz_x(_ value: CGFloat) -> Self{
        zz_x = value
        return self
    }

    @discardableResult func zz_y(_ value: CGFloat) -> Self{
        zz_y = value
        return self
    }

    @discardableResult func zz_width(_ value: CGFloat) -> Self{
        zz_width = value
        return self
    }

    @discardableResult func zz_height(_ value: CGFloat) -> Self{
        zz_height = value
        return self
    }

    @discardableResult func zz_size(_ value: CGSize) -> Self{
        zz_size = value
        return self
    }

    @discardableResult func zz_origin(_ value: CGPoint) -> Self{
        zz_origin = value
        return self
    }

    @discardableResult func zz_center(_ value: CGPoint) -> Self{
        zz_center = value
        return self
    }

    @discardableResult func zz_centerX(_ value: CGFloat) -> Self{
        zz_centerX = value
        return self
    }

    @discardableResult func zz_centerY(_ value: CGFloat) -> Self{
        zz_centerY = value
        return self
    }

    @discardableResult func zz_frame(_ value: CGRect) -> Self{
        zz_frame = value
        return self
    }

    @discardableResult func zz_bounds(_ value: CGRect) -> Self{
        zz_bounds = value
        return self
    }
}

//MARK: - 常用属性

public extension CALayer{
    var zz_position: CGPoint {
        get { return self.position  }
        set { self.position = newValue }
    }

    var zz_zPosition: CGFloat {
        get { return self.zPosition  }
        set { self.zPosition = newValue }
    }

    var zz_anchorPoint: CGPoint {
        get { return self.anchorPoint  }
        set { self.anchorPoint = newValue }
    }

    var zz_anchorPointZ: CGFloat {
        get { return self.anchorPointZ  }
        set { self.anchorPointZ = newValue }
    }

    var zz_transform: CATransform3D {
        get { return self.transform  }
        set { self.transform = newValue }
    }

    var zz_isHidden: Bool {
        get { return self.isHidden  }
        set { self.isHidden = newValue }
    }

    var zz_isDoubleSided: Bool {
        get { return self.isDoubleSided  }
        set { self.isDoubleSided = newValue }
    }

    var zz_isGeometryFlipped: Bool {
        get { return self.isGeometryFlipped  }
        set { self.isGeometryFlipped = newValue }
    }

    var zz_sublayerTransform: CATransform3D {
        get { return self.sublayerTransform  }
        set { self.sublayerTransform = newValue }
    }

    var zz_mask: CALayer? {
        get { return self.mask  }
        set { self.mask = newValue }
    }

    var zz_masksToBounds: Bool {
        get { return self.masksToBounds  }
        set { self.masksToBounds = newValue }
    }

    var zz_contents: Any? {
        get { return self.contents  }
        set { self.contents = newValue }
    }

    var zz_contentsRect: CGRect {
        get { return self.contentsRect  }
        set { self.contentsRect = newValue }
    }

    var zz_contentsGravity: CALayerContentsGravity {
        get { return self.contentsGravity  }
        set { self.contentsGravity = newValue }
    }

    @available(iOS 4.0, *)
    var zz_contentsScale: CGFloat {
        get { return self.contentsScale  }
        set { self.contentsScale = newValue }
    }

    var zz_contentsCenter: CGRect {
        get { return self.contentsCenter  }
        set { self.contentsCenter = newValue }
    }

    @available(iOS 10.0, *)
    var zz_contentsFormat: CALayerContentsFormat {
        get { return self.contentsFormat  }
        set { self.contentsFormat = newValue }
    }

    @available(iOS 17.0, *)
    var zz_wantsExtendedDynamicRangeContent: Bool {
        get { return self.wantsExtendedDynamicRangeContent  }
        set { self.wantsExtendedDynamicRangeContent = newValue }
    }

    var zz_minificationFilter: CALayerContentsFilter {
        get { return self.minificationFilter  }
        set { self.minificationFilter = newValue }
    }

    var zz_magnificationFilter: CALayerContentsFilter {
        get { return self.magnificationFilter  }
        set { self.magnificationFilter = newValue }
    }

    var zz_minificationFilterBias: Float {
        get { return self.minificationFilterBias  }
        set { self.minificationFilterBias = newValue }
    }

    var zz_isOpaque: Bool {
        get { return self.isOpaque  }
        set { self.isOpaque = newValue }
    }

    var zz_needsDisplayOnBoundsChange: Bool {
        get { return self.needsDisplayOnBoundsChange  }
        set { self.needsDisplayOnBoundsChange = newValue }
    }

    @available(iOS 6.0, *)
    var zz_drawsAsynchronously: Bool {
        get { return self.drawsAsynchronously  }
        set { self.drawsAsynchronously = newValue }
    }

    var zz_edgeAntialiasingMask: CAEdgeAntialiasingMask {
        get { return self.edgeAntialiasingMask  }
        set { self.edgeAntialiasingMask = newValue }
    }

    @available(iOS 6.0, *)
    var zz_allowsEdgeAntialiasing: Bool {
        get { return self.allowsEdgeAntialiasing  }
        set { self.allowsEdgeAntialiasing = newValue }
    }

    var zz_backgroundColor: CGColor? {
        get { return self.backgroundColor  }
        set { self.backgroundColor = newValue }
    }

    var zz_cornerRadius: CGFloat {
        get { return self.cornerRadius  }
        set { self.cornerRadius = newValue }
    }

    @available(iOS 11.0, *)
    var zz_maskedCorners: CACornerMask {
        get { return self.maskedCorners  }
        set { self.maskedCorners = newValue }
    }

    @available(iOS 13.0, *)
    var zz_cornerCurve: CALayerCornerCurve {
        get { return self.cornerCurve }
        set { self.cornerCurve = newValue }
    }

    var zz_borderWidth: CGFloat {
        get { return self.borderWidth  }
        set { self.borderWidth = newValue }
    }

    var zz_borderColor: CGColor? {
        get { return self.borderColor  }
        set { self.borderColor = newValue }
    }

    var zz_opacity: Float {
        get { return self.opacity  }
        set { self.opacity = newValue }
    }

    @available(iOS 2.0, *)
    var zz_allowsGroupOpacity: Bool {
        get { return self.allowsGroupOpacity  }
        set { self.allowsGroupOpacity = newValue }
    }

    var zz_compositingFilter: Any? {
        get { return self.compositingFilter  }
        set { self.compositingFilter = newValue }
    }

    var zz_filters: [Any]? {
        get { return self.filters  }
        set { self.filters = newValue }
    }

    var zz_backgroundFilters: [Any]? {
        get { return self.backgroundFilters  }
        set { self.backgroundFilters = newValue }
    }

    var zz_shouldRasterize: Bool {
        get { return self.shouldRasterize  }
        set { self.shouldRasterize = newValue }
    }

    var zz_rasterizationScale: CGFloat {
        get { return self.rasterizationScale  }
        set { self.rasterizationScale = newValue }
    }

    var zz_shadowColor: CGColor? {
        get { return self.shadowColor  }
        set { self.shadowColor = newValue }
    }

    var zz_shadowOffset: CGSize {
        get { return self.shadowOffset  }
        set { self.shadowOffset = newValue }
    }

    var zz_shadowRadius: CGFloat {
        get { return self.shadowRadius  }
        set { self.shadowRadius = newValue }
    }

    var zz_shadowPath: CGPath? {
        get { return self.shadowPath  }
        set { self.shadowPath = newValue }
    }

    var zz_name: String? {
        get { return self.name  }
        set { self.name = newValue }
    }

    var zz_style: [AnyHashable : Any]? {
        get { return self.style  }
        set { self.style = newValue }
    }
}

public extension CALayer{
    @discardableResult func zz_position(_ value: CGPoint) -> Self{
        zz_position = value
        return self
    }

    @discardableResult func zz_zPosition(_ value: CGFloat) -> Self{
        zz_zPosition = value
        return self
    }

    @discardableResult func zz_anchorPoint(_ value: CGPoint) -> Self{
        zz_anchorPoint = value
        return self
    }

    @discardableResult func zz_anchorPointZ(_ value: CGFloat) -> Self{
        zz_anchorPointZ = value
        return self
    }

    @discardableResult func zz_transform(_ value: CATransform3D) -> Self{
        zz_transform = value
        return self
    }

    @discardableResult func zz_isHidden(_ value: Bool) -> Self{
        zz_isHidden = value
        return self
    }

    @discardableResult func zz_isDoubleSided(_ value: Bool) -> Self{
        zz_isDoubleSided = value
        return self
    }

    @discardableResult func zz_isGeometryFlipped(_ value: Bool) -> Self{
        zz_isGeometryFlipped = value
        return self
    }

    @discardableResult func zz_sublayerTransform(_ value: CATransform3D) -> Self{
        zz_sublayerTransform = value
        return self
    }

    @discardableResult func zz_mask(_ value: CALayer?) -> Self{
        zz_mask = value
        return self
    }

    @discardableResult func zz_masksToBounds(_ value: Bool) -> Self{
        zz_masksToBounds = value
        return self
    }

    @discardableResult func zz_contents(_ value: Any?) -> Self{
        zz_contents = value
        return self
    }

    @discardableResult func zz_contentsRect(_ value: CGRect) -> Self{
        zz_contentsRect = value
        return self
    }

    @discardableResult func zz_contentsGravity(_ value: CALayerContentsGravity) -> Self{
        zz_contentsGravity = value
        return self
    }

    @available(iOS 4.0, *)
    @discardableResult func zz_contentsScale(_ value: CGFloat) -> Self{
        zz_contentsScale = value
        return self
    }

    @discardableResult func zz_contentsCenter(_ value: CGRect) -> Self{
        zz_contentsCenter = value
        return self
    }

    @available(iOS 10.0, *)
    @discardableResult func zz_contentsFormat(_ value: CALayerContentsFormat) -> Self{
        zz_contentsFormat = value
        return self
    }

    @available(iOS 17.0, *)
    @discardableResult func zz_wantsExtendedDynamicRangeContent(_ value: Bool) -> Self{
        zz_wantsExtendedDynamicRangeContent = value
        return self
    }

    @discardableResult func zz_minificationFilter(_ value: CALayerContentsFilter) -> Self{
        zz_minificationFilter = value
        return self
    }

    @discardableResult func zz_magnificationFilter(_ value: CALayerContentsFilter) -> Self{
        zz_magnificationFilter = value
        return self
    }

    @discardableResult func zz_minificationFilterBias(_ value: Float) -> Self{
        zz_minificationFilterBias = value
        return self
    }

    @discardableResult func zz_isOpaque(_ value: Bool) -> Self{
        zz_isOpaque = value
        return self
    }

    @discardableResult func zz_needsDisplayOnBoundsChange(_ value: Bool) -> Self{
        zz_needsDisplayOnBoundsChange = value
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult func zz_drawsAsynchronously(_ value: Bool) -> Self{
        zz_drawsAsynchronously = value
        return self
    }

    @discardableResult func zz_edgeAntialiasingMask(_ value: CAEdgeAntialiasingMask) -> Self{
        zz_edgeAntialiasingMask = value
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult func zz_allowsEdgeAntialiasing(_ value: Bool) -> Self{
        zz_allowsEdgeAntialiasing = value
        return self
    }

    @discardableResult func zz_backgroundColor(_ value: CGColor?) -> Self{
        zz_backgroundColor = value
        return self
    }

    @discardableResult func zz_cornerRadius(_ value: CGFloat) -> Self{
        zz_cornerRadius = value
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult func zz_maskedCorners(_ value: CACornerMask) -> Self{
        zz_maskedCorners = value
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult func zz_cornerCurve(_ value: CALayerCornerCurve) -> Self{
        zz_cornerCurve = value
        return self
    }

    @discardableResult func zz_borderWidth(_ value: CGFloat) -> Self{
        zz_borderWidth = value
        return self
    }

    @discardableResult func zz_borderColor(_ value: CGColor?) -> Self{
        zz_borderColor = value
        return self
    }

    @discardableResult func zz_opacity(_ value: Float) -> Self{
        zz_opacity = value
        return self
    }

    @available(iOS 2.0, *)
    @discardableResult func zz_allowsGroupOpacity(_ value: Bool) -> Self{
        zz_allowsGroupOpacity = value
        return self
    }

    @discardableResult func zz_compositingFilter(_ value: Any?) -> Self{
        zz_compositingFilter = value
        return self
    }

    @discardableResult func zz_filters(_ value: [Any]?) -> Self{
        zz_filters = value
        return self
    }

    @discardableResult func zz_backgroundFilters(_ value: [Any]?) -> Self{
        zz_backgroundFilters = value
        return self
    }

    @discardableResult func zz_shouldRasterize(_ value: Bool) -> Self{
        zz_shouldRasterize = value
        return self
    }

    @discardableResult func zz_rasterizationScale(_ value: CGFloat) -> Self{
        zz_rasterizationScale = value
        return self
    }

    @discardableResult func zz_shadowColor(_ value: CGColor?) -> Self{
        zz_shadowColor = value
        return self
    }

    @discardableResult func zz_shadowOffset(_ value: CGSize) -> Self{
        zz_shadowOffset = value
        return self
    }

    @discardableResult func zz_shadowRadius(_ value: CGFloat) -> Self{
        zz_shadowRadius = value
        return self
    }

    @discardableResult func zz_shadowPath(_ value: CGPath?) -> Self{
        zz_shadowPath = value
        return self
    }

    @discardableResult func zz_name(_ value: String?) -> Self{
        zz_name = value
        return self
    }

    @discardableResult func zz_style(_ value: [AnyHashable : Any]?) -> Self{
        zz_style = value
        return self
    }
}

//MARK: - Animation
public extension CALayer{
    struct ZZAnimationKey {
        public var rawValue: String
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let  position = ZZAnimationKey(rawValue: "position") // 移动到另外一个 点(point)
        public static let  cornerRadius = ZZAnimationKey(rawValue: "cornerRadius") // 圆角动画
        public static let  transformRotation = ZZAnimationKey(rawValue: "tranform.rotation")
        public static let  transformRotationX = ZZAnimationKey(rawValue: "tranform.rotation.x")
        public static let  transformRotationY = ZZAnimationKey(rawValue: "tranform.rotation.y")
        public static let  transformRotationZ = ZZAnimationKey(rawValue: "tranform.rotation.z")
        public static let  transformScale = ZZAnimationKey(rawValue: "tranform.scale")
        public static let  transformScaleX = ZZAnimationKey(rawValue: "tranform.scale.x")
        public static let  transformScaleY = ZZAnimationKey(rawValue: "tranform.scale.y")
        public static let  transformScaleZ = ZZAnimationKey(rawValue: "tranform.scale.z")
        public static let  transformTranslationX = ZZAnimationKey(rawValue: "tranform.translation.x")
        public static let  transformTranslationY = ZZAnimationKey(rawValue: "tranform.translation.y")
        public static let  transformTranslationZ  = ZZAnimationKey(rawValue: "tranform.translation.z")
    }
    
    /// CABasicAnimation 基础动画
    /// - Parameters:
    ///   - key: ZZAnimationKey 动画类型
    ///   - startValue: 起始值
    ///   - endValue: 结束值
    ///   - duration: 动画时间
    ///   - delay: 动画延迟时间 默认：0
    ///   - repeatCount: 动画循环次数 默认：1
    ///   - removedOnCompletion: 动画结束之后位置是否保持不变（即动画结束是否依然在startValue）默认： false
    ///   - option: 动画方式  linear: 匀速 easeIn: 慢进 easeOut: 慢出 easeInEaseOut: 慢进慢出 default: 慢进慢出 默认：default
    @discardableResult func zz_animation(key: ZZAnimationKey,
                      startValue: Any?,
                      endValue: Any?,
                      duration: TimeInterval = 2.0,
                      delay: TimeInterval = 0,
                      repeatCount: Float = 1,
                      removedOnCompletion: Bool = false,
                      option: CAMediaTimingFunctionName = .default) -> CABasicAnimation{
        
        let translatonAnimation: CABasicAnimation = CABasicAnimation()
        // 几秒后执行
        translatonAnimation.beginTime = CACurrentMediaTime() + delay
        // 动画的类型
        translatonAnimation.keyPath = key.rawValue
        // 起始的值
        if let weakStartValue = startValue {
            translatonAnimation.fromValue = weakStartValue
        }
        // 结束的值
        translatonAnimation.toValue = endValue
        // 动画持续的时间
        translatonAnimation.duration = duration
        translatonAnimation.repeatCount = repeatCount
        // 运动后的位置保持不变（layer的最后位置是toValue）
        translatonAnimation.isRemovedOnCompletion = removedOnCompletion
        // 图层保持动画执行后的状态，前提是fillMode设置为kCAFillModeForwards
        translatonAnimation.fillMode = CAMediaTimingFillMode.forwards
        translatonAnimation.timingFunction = CAMediaTimingFunction(name: option)
        add(translatonAnimation, forKey: nil)
        return translatonAnimation
    }
    
    /// CAKeyframeAnimation 基础动画
    /// - Parameters:
    ///   - key: ZZAnimationKey 动画类型
    ///   - values: 关键帧数组对象，里面每一个元素即为一个关键帧，动画会在对应的时间段内，依次执行数组中每一个关键帧的动画
    ///   - keyTimes: 设置关键帧对应的时间点，范围：0-1。如果没有设置该属性，则每一帧的时间平分
    ///   - duration: 动画时间
    ///   - delay: 动画延迟时间
    ///   - repeatCount: 动画循环次数
    ///   - path: 动画路径
    ///   - removedOnCompletion: 动画结束之后位置是否保持不变 默认： false
    ///   - option: 动画方式
    ///   - rotationMode: 旋转方式
    @discardableResult func zz_animation(key: ZZAnimationKey,
                      values: [Any]?,
                      keyTimes: [NSNumber]?,
                      duration: TimeInterval = 2.0,
                      delay: TimeInterval = 0,
                      repeatCount: Float = 1,
                      path: CGPath? = nil,
                      removedOnCompletion: Bool = false,
                      option: CAMediaTimingFunctionName = .default,
                      rotationMode: CAAnimationRotationMode? = nil) -> CAKeyframeAnimation{
        let keyframeAnimation = CAKeyframeAnimation(keyPath: key.rawValue)
        keyframeAnimation.duration = duration
        // 几秒后执行
        keyframeAnimation.beginTime = CACurrentMediaTime() + delay
        keyframeAnimation.isRemovedOnCompletion = removedOnCompletion
        keyframeAnimation.fillMode = .forwards
        keyframeAnimation.repeatCount = repeatCount
        // 传进来的值，可以是一组 CGPoint
        if let weakValues = values {
            keyframeAnimation.values = weakValues
        }
        if let weakKeyTimes = keyTimes {
            keyframeAnimation.keyTimes = weakKeyTimes
        }
        if let weakPath = path {
            keyframeAnimation.path = weakPath
            // 计算模式 -> 强制运动,匀速进行,不管路径有多远!否则一次动画结束会有短暂停顿
            keyframeAnimation.calculationMode = .cubicPaced
        }
        // 旋转模式 -> 沿着路径,自行旋转 转的时候需要沿着路径的切线!进行转动!
        keyframeAnimation.rotationMode = rotationMode
        //  动画的时间节奏控制 方式
        keyframeAnimation.timingFunction = CAMediaTimingFunction(name: option)
        add(keyframeAnimation, forKey: nil)
        return keyframeAnimation
    }
    
    /// CASpringAnimation 基础动画  弹簧效果
    /// - Parameters:
    ///   - key: ZZAnimationKey 动画类型
    ///   - toValue: 终点位置
    ///   - delay: 延迟时间
    ///   - mass:  质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
    ///   - stiffness: 弹性系数（弹性系数越大，弹簧的运动越快）
    ///   - damping: 阻尼系数（阻尼系数越大，弹簧的停止越快）
    ///   - initialVelocity: 初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
    ///   - repeatCount: 动画执行的次数
    ///   - removedOnCompletion: 运动后的位置保持不变（layer的最后位置是toValue）
    ///   - option: 动画的时间节奏控制 方式
    @discardableResult func zz_animation(key: ZZAnimationKey,
                      toValue: Any?,
                      delay: TimeInterval = 0,
                      mass: CGFloat = 10.0,
                      stiffness: CGFloat = 50,
                      damping: CGFloat = 100.0,
                      initialVelocity: CGFloat = 5,
                      repeatCount: Float = 1,
                      removedOnCompletion: Bool = false,
                      option: CAMediaTimingFunctionName = .default) -> CASpringAnimation{
        
        let springAnimation = CASpringAnimation(keyPath: key.rawValue)
        // 几秒后执行
        springAnimation.beginTime = CACurrentMediaTime() + delay
        // 质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
        springAnimation.mass = mass
        // 刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
        springAnimation.stiffness = stiffness
        // 阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
        springAnimation.damping = damping
        // 初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
        springAnimation.initialVelocity = initialVelocity
        // settlingDuration：结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置）
        springAnimation.duration = springAnimation.settlingDuration
        springAnimation.toValue = toValue
        springAnimation.repeatCount = repeatCount
        springAnimation.isRemovedOnCompletion = removedOnCompletion
        springAnimation.fillMode = CAMediaTimingFillMode.forwards
        // 动画的时间节奏控制 方式
        springAnimation.timingFunction = CAMediaTimingFunction(name: option)
        add(springAnimation, forKey: nil)
        
        return springAnimation
    }
    
    
    /// CAAnimationGroup 的基类动画
    /// - Parameters:
    ///   - animations: 动画组
    ///   - duration: 动画时长
    ///   - delay: 动画时长
    ///   - repeatCount: 重复次数
    ///   - removedOnCompletion: 运动后的位置保持不变（layer的最后位置是toValue）
    ///   - option:  动画的时间节奏控制 方式
    @discardableResult func zz_animation_group(_ animations: [CAAnimation]?,
                            duration: TimeInterval = 2.0,
                            delay: TimeInterval = 0,
                            repeatCount: Float = 1,
                            removedOnCompletion: Bool = false,
                            option: CAMediaTimingFunctionName = .default) -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = CACurrentMediaTime() + delay
        animationGroup.animations = animations
        animationGroup.duration = duration
        animationGroup.fillMode = .forwards
        animationGroup.repeatCount = repeatCount
        animationGroup.isRemovedOnCompletion = removedOnCompletion
        // 动画的时间节奏控制 方式
        animationGroup.timingFunction = CAMediaTimingFunction(name: option)
        add(animationGroup, forKey: nil)
        return animationGroup
    }
}
