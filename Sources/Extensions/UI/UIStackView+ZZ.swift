//
//  UIStackView+ZZ.swift
//  Pods
//
//  Created by 陈钟 on 2025/4/9.
//


public extension UIStackView{
    convenience init(arrangedSubviews views: [UIView] = [],
                     axis: NSLayoutConstraint.Axis,
                     alignment: UIStackView.Alignment,
                     distribution: UIStackView.Distribution,
                     spacing: CGFloat = 0) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        views.enumerated().forEach({ self.addArrangedSubview($1) })
    }
    
    @discardableResult
    func zz_remove(view: UIView) -> Self{
        self.removeArrangedSubview(view)
        view.removeFromSuperview()
        return self
    }
    
    @discardableResult
    func zz_removeAllArrangedSubView() -> Self{
        self.arrangedSubviews.forEach({ zz_remove(view: $0) })
        return self
    }
    
    @discardableResult
    static func zz_h(_ views: [UIView], alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .equalSpacing, spacing: CGFloat = 0) -> UIStackView{
        return UIStackView(arrangedSubviews: views, axis: .horizontal, alignment: alignment, distribution: distribution, spacing: spacing)
    }
    
    @discardableResult
    static func zz_v(_ views: [UIView], alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .equalSpacing, spacing: CGFloat = 0) -> UIStackView{
        return UIStackView(arrangedSubviews: views, axis: .vertical, alignment: alignment, distribution: distribution, spacing: spacing)
    }
}
