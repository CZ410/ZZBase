//
//  UIButton+ZZ.swift
//  Pods
//
//  Created by 陈钟 on 2025/7/30.
//

public extension UIButton {
    @discardableResult
    func zz_titleLabel(label: (UILabel?) -> Void) -> Self {
        label(titleLabel)
        return self
    }

    @discardableResult
    func zz_setTitle(_ title: String?, for state: UIControl.State) -> Self {
        setTitle(title, for: state)
        return self
    }

    @discardableResult
    func zz_setTitleColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        setTitleColor(color, for: state)
        return self
    }

    @discardableResult
    func zz_setTitleShadowColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        setTitleShadowColor(color, for: state)
        return self
    }

    @discardableResult
    func zz_setImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setImage(image, for: state)
        return self
    }

    @discardableResult
    func zz_setBackgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func zz_setPreferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State) -> Self {
        setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }

    @available(iOS 6.0, *)
    @discardableResult
    func zz_setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) -> Self {
        setAttributedTitle(title, for: state)
        return self
    }

    @discardableResult
    func zz_contentEdgeInsets(_ v: UIEdgeInsets) -> Self {
        if #available(iOS 15.0, *) {
            self.configuration?.contentInsets = .init(top: v.top, leading: v.left, bottom: v.bottom, trailing: v.right)
        } else {
            contentEdgeInsets = v
        }
        return self
    }
    
    @discardableResult
    func zz_titleEdgeInsets(_ v: UIEdgeInsets) -> Self {
        titleEdgeInsets = v
        return self
    }
    
    @discardableResult
    func zz_imageEdgeInsets(_ v: UIEdgeInsets) -> Self {
        imageEdgeInsets = v
        return self
    }
    
    @discardableResult
    func zz_reversesTitleShadowWhenHighlighted(_ v: Bool) -> Self {
        reversesTitleShadowWhenHighlighted = v
        return self
    }
    
    @discardableResult
    func zz_adjustsImageWhenHighlighted(_ v: Bool) -> Self {
        adjustsImageWhenHighlighted = v
        return self
    }
    
    @discardableResult
    func zz_adjustsImageWhenDisabled(_ v: Bool) -> Self {
        adjustsImageWhenDisabled = v
        return self
    }
    
    @discardableResult
    func zz_showsTouchWhenHighlighted(_ v: Bool) -> Self {
        showsTouchWhenHighlighted = v
        return self
    }
}

public extension UIButton {
    enum ImageAlignment {
        case top, left, bottom, right

        @available(iOS 15.0, *)
        var imagePlacement: NSDirectionalRectEdge {
            switch self {
            case .top:
                return .top
            case .left:
                return .leading
            case .bottom:
                return .bottom
            case .right:
                return .trailing
            }
        }
    }

    @discardableResult
    func zz_setImageAlignment(_ v: ImageAlignment, spacing: CGFloat = 0) -> Self {
        if #available(iOS 15, *) {
            var config = UIButton.Configuration.plain()
            config.imagePlacement = v.imagePlacement
            config.imagePadding = spacing
            self.configuration = config
            return self
        }
        let titleWidth = titleLabel?.zz_width ?? 0
        let titleHeight = titleLabel?.zz_height ?? 0
        let imageWidth = imageView?.zz_width ?? 0
        let imageHeight = imageView?.zz_height ?? 0
        let width = zz_width
        switch v {
        case .left:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing / 2, bottom: 0, right: -spacing / 2)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing / 2, bottom: 0, right: spacing / 2)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth + spacing / 2, bottom: 0, right: -(titleWidth + spacing / 2))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + spacing / 2), bottom: 0, right: imageWidth + spacing / 2)
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -titleHeight - spacing / 2, left: (width - imageWidth) / 2, bottom: 0, right: (width - imageWidth) / 2 - titleWidth)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - spacing / 2, right: 0)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: (width - imageWidth) / 2, bottom: -titleHeight - spacing / 2, right: (width - imageWidth) / 2 - titleWidth)
            titleEdgeInsets = UIEdgeInsets(top: -imageHeight - spacing / 2, left: -imageWidth, bottom: 0, right: 0)
        }
        return self
    }
}
