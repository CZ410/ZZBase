//
//  UIView+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation
import UIKit

//MARK: - Frame
public extension UIView{
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
    
    @discardableResult func zz_x(_ value: CGFloat) -> Self{
        zz_x = value
        return self
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
    
    @discardableResult func zz_y(_ value: CGFloat) -> Self{
        zz_y = value
        return self
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
    
    @discardableResult func zz_width(_ value: CGFloat) -> Self{
        zz_width = value
        return self
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
    
    @discardableResult func zz_height(_ value: CGFloat) -> Self{
        zz_height = value
        return self
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
    
    @discardableResult func zz_size(_ value: CGSize) -> Self{
        zz_size = value
        return self
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
    
    @discardableResult func zz_origin(_ value: CGPoint) -> Self{
        zz_origin = value
        return self
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
    
    @discardableResult func zz_center(_ value: CGPoint) -> Self{
        zz_center = value
        return self
    }
    
    var zz_centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    @discardableResult func zz_centerX(_ value: CGFloat) -> Self{
        zz_centerX = value
        return self
    }
    
    var zz_centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    @discardableResult func zz_centerY(_ value: CGFloat) -> Self{
        zz_centerY = value
        return self
    }
    
    var zz_frame: CGRect {
        get {
            return self.frame
        }
        set {
            self.frame = newValue
        }
    }
    
    @discardableResult func zz_frame(_ value: CGRect) -> Self{
        zz_frame = value
        return self
    }
    
    var zz_alpha: CGFloat {
        get {
            return self.alpha
        }
        set {
            self.alpha = newValue
        }
    }
    
    @discardableResult func zz_alpha(_ alpha: CGFloat) -> Self{
        self.zz_alpha = alpha
        return self
    }
    
    var zz_borderColor: UIColor {
        get {
            return UIColor.init(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @discardableResult func zz_borderColor(_ value: UIColor) -> Self{
        zz_borderColor = value
        return self
    }
    
    var zz_borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @discardableResult func zz_borderWidth(_ value: CGFloat) -> Self{
        zz_borderWidth = value
        return self
    }
    
    var zz_cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
    
    @discardableResult func zz_cornerRadius(_ value: CGFloat) -> Self{
        zz_cornerRadius = value
        return self
    }
    
    var zz_masksToBounds: Bool{
        get{
            return self.layer.masksToBounds
        }
        set{
            self.layer.masksToBounds = newValue
        }
    }
    
    @discardableResult func zz_masksToBounds(_ value: Bool) -> Self{
        zz_masksToBounds = value
        return self
    }
    
    var zz_backgroundColor: UIColor?{
        get{
            return self.backgroundColor
        }
        set{
            self.backgroundColor = newValue
        }
    }
    
    @discardableResult func zz_backgroundColor(_ value: UIColor) -> Self{
        zz_backgroundColor = value
        return self
    }
    
    var zz_isUserInteractionEnabled: Bool{
        get{
            return self.isUserInteractionEnabled
        }
        set{
            self.isUserInteractionEnabled = newValue
        }
    }
    
    @discardableResult func zz_isUserInteractionEnabled(_ enable: Bool) -> Self{
        zz_isUserInteractionEnabled = enable
        return self
    }
    
    
    var zz_isHidden: Bool{
        get{
            return self.isHidden
        }
        set{
            self.isHidden = newValue
        }
    }
    
    @discardableResult func zz_isHidden(_ enable: Bool) -> Self{
        zz_isHidden = enable
        return self
    }

    var zz_contentMode: ContentMode{
        get {
            return self.contentMode
        }
        set {
            self.contentMode = newValue
        }
    }

    @discardableResult func zz_contentMode(_ contentMode: ContentMode) -> Self{
        zz_contentMode = contentMode
        return self
    }
    
    /// 边框
    /// - Parameters:
    ///   - width: 边框宽度
    ///   - color: 边框颜色
    ///   - radius: 边框圆角大小
    /// - Returns: 本身
    @discardableResult func zz_border(width: CGFloat = 0.5, color: UIColor = UIColor.gray, radius: CGFloat? = nil) -> Self {
        self.zz_borderColor(color)
            .zz_borderWidth(width)
        guard let radius = radius else { return self}
        self.zz_cornerRadius(radius)
        return self
    }
    
    /// 虚线边框
    /// - Parameters:
    ///   - corners: 边框圆角位置
    ///   - radii: 圆角大小
    ///   - width: 边框宽度 默认0.5
    ///   - lineDashPattern: 虚线模式 默认[2, 1]
    ///   - color: 虚线颜色
    /// - Returns: 本身
    @discardableResult func zz_dottedBorder(corners: UIRectCorner,
                                            radii: CGFloat,
                                            width: CGFloat = 0.5,
                                            color: UIColor = UIColor.gray,
                                            lineDashPattern: [NSNumber]? = [2, 1]) -> Self{
        self.zz_round(corners, radii: radii)
        guard let roundLayer = self.roundCornerLayer else { return self }
        roundLayer.strokeColor = color.cgColor
        roundLayer.fillColor = UIColor.clear.cgColor
        roundLayer.lineWidth = width
        roundLayer.lineDashPattern = lineDashPattern
        self.layer.mask = nil
        self.layer.insertSublayer(roundLayer, at: 0)
        return self
    }

    @discardableResult func zz_addSubView(_ view: UIView) -> Self {
        addSubview(view)
        return self
    }
    
    @discardableResult func zz_addSubView(_ view: UIView, constraint: NSLayoutConstraint) -> Self{
        return zz_addSubView(view, constraints: [constraint])
    }
    
    @discardableResult func zz_addSubView(_ view: UIView, constraints: [NSLayoutConstraint]) -> Self{
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
        return self
    }
    
    /// 一次添加多个子控件
    @discardableResult func zz_addSubViews(subviews:[UIView]) -> Self {
        for view in subviews {
            addSubview(view)
        }
        return self
    }
    
    @discardableResult func zz_addSubViews(subviews:[UIView], constraints: [NSLayoutConstraint]) -> Self {
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        NSLayoutConstraint.activate(constraints)
        return self
    }
    
    @discardableResult func zz_insertSubView(_ view: UIView, at index: Int) -> Self{
        self.insertSubview(view, at: index)
        return self
    }
    
    @discardableResult func zz_insertSubView(_ view: UIView, belowSubview: UIView) -> Self{
        self.insertSubview(view, belowSubview: belowSubview)
        return self
    }
    
    @discardableResult func zz_insertSubView(_ view: UIView, aboveSubview: UIView) -> Self{
        self.insertSubview(view, aboveSubview: aboveSubview)
        return self
    }
    
    /// 删除所有的字窗体
    func zz_removeAllSubViews(){
        while self.subviews.count > 0 {
            self.subviews.last?.removeFromSuperview()
        }
    }
    
    /// 删除本窗体中 选中的子窗体
    /// - Parameter subViews: 想要删除的窗体
    func zz_remove(_ subViews: [UIView]) -> Void {
        for subView in subViews {
            subView.removeFromSuperview()
        }
    }
    
    /// 找到本窗体中的
    func zz_find<T: UIView>(_ Class: T.Type) -> T? {
        for subview in self.subviews {
            if subview is T {
                return subview as? T
            }
        }
        return nil
    }
    
    /// 查找当前View是否包含view
    /// - Parameter view: 需要查找的view
    func zz_isHave(view: UIView) -> Bool{
        return self.zz_isHave(view: view, in: self)
    }
    
    private func zz_isHave(view: UIView, in superView: UIView) -> Bool{
        guard superView.subviews.count > 0  else { return false }
        for subView in superView.subviews {
            if subView == view { return true }
            if self.zz_isHave(view: view, in: subView){
                return true
            }
        }
        return false
    }
    
    /// 找到当前控件所在的控制器
    func zz_getCurrentViewCtrl() -> UIViewController? {
        var nextResponder = next
        repeat {
            let isVC = nextResponder?.isKind(of: UIViewController.self)
            if isVC != nil {
                return nextResponder as? UIViewController
            }
            nextResponder = nextResponder?.next
        } while (nextResponder != nil)
        return nil
    }
}

//MARK: - UITapGestureRecognizer
public extension UIView{
    class UIViewTapBlockTarget: NSObject {
        typealias TargetAlias = (_ sender: Any) -> Void
        var block: TargetAlias?

        init(block: @escaping TargetAlias) {
            super.init()
            self.block = block
        }

        @objc func invoke(sender: Any){
            self.block?(sender)
        }
    }

    private var tapTargets: [UIViewTapBlockTarget]{
        set{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "tapTargets".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "tapTargets".hashValue)
            let obj = objc_getAssociatedObject(self, key)
            return (obj as? [UIViewTapBlockTarget]) ?? []
        }
    }

    private var tapGesture: UITapGestureRecognizer?{
        set{ zz_objc_set(key: "tapGesture", newValue) }
        get{ return zz_objc_get(key: "tapGesture", UITapGestureRecognizer.self)}
    }

    @discardableResult func zz_addTap(target: Any?, action: Selector?) -> Self{
        self.zz_isUserInteractionEnabled(true)
        zz_removeTap()
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
        tapGesture = tap
        return self
    }

    /// 添加事件
    @discardableResult func zz_addTap(block:@escaping ((_ sender: Any) -> Void)) -> Self{
        let blockTages = UIViewTapBlockTarget(block: block)
        zz_addTap(target: blockTages, action: #selector(blockTages.invoke(sender:)))
        self.tapTargets.append(blockTages)
        return self
    }
    
    /// 删除通过 zz_addTap 绑定的事件
    @discardableResult func zz_removeTap() -> Self{
        if let tapges = tapGesture{
            removeGestureRecognizer(tapges)
            tapGesture = nil
        }
        tapTargets.removeAll()
        return self
    }
}

//MARK: - 渐变层
public extension UIView{
    /// 渐变层
    private(set) var gradientLayer: CAGradientLayer?{
        set{
            let key: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "gradientLayer".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            let key: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "gradientLayer".hashValue)
            let obj = objc_getAssociatedObject(self, key)
            return obj as? CAGradientLayer
        }
    }
    
    @discardableResult func zz_gradientLayer(_ block:@escaping (CAGradientLayer?) -> ()) -> Self{
        block(self.gradientLayer)
        return self
    }

    ///  移除渐变层
    func zz_removeGradient(){
        self.zz_removeObservers(["frame","bounds"], key: "gradientLayer")
        self.gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
    }
    
    /// 添加一个渐变层  通过KVO监听父试图Frame变化自动改变渐变层Layer的大小
    /// - Parameters:
    ///   - colors: 颜色组
    ///   - startPoint: 开始位置x,y 在 0～1 之间
    ///   - endPoint: 结束位置x,y  在 0～1 之间
    ///   - locations: 渐变不同颜色位置 对应颜色组 0～1之间
    @discardableResult func zz_addGradient(colors: [Any]?, start startPoint: CGPoint = CGPoint(x: 0, y: 0.5), end endPoint:CGPoint = CGPoint(x: 1, y: 0.5), locations: [NSNumber] = [0, 1]) -> Self{
        if self.gradientLayer == nil {
            self.gradientLayer = CAGradientLayer()
            self.gradientLayer?.frame = self.bounds

            self.zz_addObservers(["frame","bounds"], key: "gradientLayer") {[weak self] value in
                guard let `self` = self else { return }
                switch value.keyPath {
                    case "frame","bounds":
                        if let gradientLayer = self.gradientLayer{
                            gradientLayer.frame = self.bounds
                        }
                        break
                    default: break
                }
            }

        }
        self.gradientLayer?.locations = locations
        self.gradientLayer?.colors = colors
        self.gradientLayer?.startPoint = startPoint
        self.gradientLayer?.endPoint = endPoint
        self.layer.insertSublayer(self.gradientLayer!, at: 0)

        return self
    }

    
    /// 添加一个渐变层  通过KVO监听父试图Frame变化自动改变渐变层Layer的大小， 在
    /// - Parameters:
    ///   - fColor: 开始颜色
    ///   - toColor: 结束颜色
    ///   - startPoint: 开始位置x,y 在 0～1 之间
    ///   - endPoint: 结束位置x,y  在 0～1 之间
    ///   - locations: 渐变不同颜色位置 对应颜色组 0～1之间
    @discardableResult func zz_addGradient(form fColor: UIColor,to toColor: UIColor,start startPoint: CGPoint = CGPoint(x: 0, y: 0.5), end endPoint:CGPoint = CGPoint(x: 1, y: 0.5), locations: [NSNumber] = [0, 1]) -> Self{
        return zz_addGradient(colors: [fColor.cgColor,toColor.cgColor],start: startPoint, end: endPoint, locations: locations)
    }
}

//MARK: - 阴影
public extension UIView{
    private(set) var zz_shadowBgLayer: CAShapeLayer?{
        set{
            zz_objc_set(key: "zz_shadowBgLayer", newValue)
        }
        get{
            return zz_objc_get(key: "zz_shadowBgLayer", CAShapeLayer.self)
        }
    }

    @discardableResult func zz_shadowBgLayer(_ block:@escaping (CAShapeLayer?) -> ()) -> Self{
        block(self.zz_shadowBgLayer)
        return self
    }

    ///  移除阴影层
    func zz_removeShadowBgLayer(){
        self.zz_removeObservers(["frame","bounds"], key: "zz_shadow_BgLayer")
        self.gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
    }

    @discardableResult func zz_shadow(color: UIColor = .gray,
                                      opacity: Float = 1,
                                      radius: CGFloat = 0,
                                      offset: CGSize = .zero,
                                      inset: UIEdgeInsets = .zero,
                                      corners: UIRectCorner = .allCorners,
                                      bgColor: UIColor? = nil) -> Self{

        func reloadShadow(){
            var frame = self.bounds
            frame.zz_x += inset.left
            frame.zz_y += inset.top
            frame.zz_width -= (inset.left + inset.right)
            frame.zz_height -= (inset.top + inset.bottom)
            let p = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: CGSize(radius))
            self.layer.shadowPath = p.cgPath

            let bgP = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(radius))
            self.zz_shadowBgLayer?.path = bgP.cgPath
        }

        if zz_shadowBgLayer == nil {
            zz_shadowBgLayer = CAShapeLayer()
            zz_shadowBgLayer?.backgroundColor = UIColor.clear.cgColor
            zz_shadowBgLayer?.strokeColor = UIColor.clear.cgColor

            self.zz_addObservers(["frame", "bounds"], key: "zz_shadow_BgLayer") { [weak self] value in
                guard let `self` = self, self.zz_width > 0, self.zz_height > 0 else { return }
                reloadShadow()
            }
        }
        zz_shadowBgLayer?.fillColor = bgColor?.cgColor

        self.layer.insertSublayer(zz_shadowBgLayer!, at: 0)

        reloadShadow()

        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
//        self.layer.cornerRadius = radius
        self.layer.shadowOffset = offset

        return self
    }
}

//MARK: - 圆角
public extension UIView{
    
    private(set) var corners: UIRectCorner {
        set{
            zz_objc_set(key: "corners", newValue)
        }
        get{
            return zz_objc_get(key: "corners", UIRectCorner.self) ?? .allCorners
        }
    }
    
    private(set) var radii: CGFloat{
        set{
            zz_objc_set(key: "radii", newValue)
        }
        get{
            return zz_objc_get(key: "radii", CGFloat.self) ?? 0
        }
    }
    
    private(set) var roundCornerLayer: CAShapeLayer?{
        set{
            zz_objc_set(key: "roundCornerLayer", newValue)
        }
        get{
            return zz_objc_get(key: "roundCornerLayer", CAShapeLayer.self)
        }
    }

    @discardableResult func zz_roundLayer(_ block:@escaping (CAShapeLayer?) -> ()) -> Self{
        block(self.roundCornerLayer)
        return self
    }

    @discardableResult func zz_removeRound() -> Self{
        self.zz_removeObservers(["frame","bounds"], key: "roundCornerLayer")
        self.roundCornerLayer?.removeFromSuperlayer()
        self.roundCornerLayer = nil
        return self
    }
    
    /// 圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角
    ///   - radii: 圆角半径
    @discardableResult func zz_round(_ corners: UIRectCorner, radii: CGFloat) -> Self{
        self.corners = corners
        self.radii = radii
        
        if self.roundCornerLayer == nil {
            let maskPath = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: self.corners,
                                        cornerRadii: CGSize(width: self.radii, height: self.radii))
            
            self.roundCornerLayer = CAShapeLayer()
            self.roundCornerLayer?.frame = self.bounds
            self.roundCornerLayer?.path = maskPath.cgPath

            self.zz_addObservers(["frame","bounds"] ,key: "roundCornerLayer") { [weak self] value in
                guard let `self` = self, let roundLayer = self.roundCornerLayer else { return }
                switch value.keyPath {
                    case "frame","bounds":
                        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                                    byRoundingCorners: self.corners,
                                                    cornerRadii: CGSize(width: self.radii, height: self.radii))
                        roundLayer.frame = self.bounds
                        roundLayer.path = maskPath.cgPath
                        break
                    default: break
                }
            }
        }
        
        self.layer.mask = self.roundCornerLayer
        return self
    }
}

//MARK: - 分割线
public extension UIView{
    
    enum UIViewLineAlignment : NSInteger {
        case top, left, bottom, right
    }
    
    /// 添加一根分割线
    /// - Parameters:
    ///   - size: 分割线大小
    ///   - alignment: 分割线对其父视图
    ///   - color: 颜色
    /// - Returns: 分割线
    @discardableResult func zz_addLine(_ size: CGFloat, alignment: UIViewLineAlignment, color: UIColor, offset: CGFloat = 0) -> (superView: UIView, line: UIView){
        let view = UIView().zz_backgroundColor(color)
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        switch alignment {
            case .top, .bottom:
                view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
                view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
                view.heightAnchor.constraint(equalToConstant: size).isActive = true
                if alignment == .top{
                    view.topAnchor.constraint(equalTo: self.topAnchor, constant: offset).isActive = true
                } else{
                    view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: offset).isActive = true
                }
            case .left, .right:
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                view.widthAnchor.constraint(equalToConstant: size).isActive = true
                if alignment == .left {
                    view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: offset).isActive = true
                }else{
                    view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: offset).isActive = true
                }
        }
        return (self, view)
    }
}

