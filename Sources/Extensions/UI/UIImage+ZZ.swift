//
//  UIImage+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation
import UIKit
import CoreImage

public extension UIImage{
    
    /// 不透明度
    var opaque: Bool {
        get {
            let alphaInfo = self.cgImage?.alphaInfo
            let opaque = alphaInfo == .noneSkipLast ||
            alphaInfo == .noneSkipFirst ||
            alphaInfo == CGImageAlphaInfo.none
            return opaque
        }
    }
    
    /// 取图片 UIImage.init(named: name)
    static func zz_named(_ name:String) -> UIImage?{
        return UIImage(named: name)
    }

    var base64: String?{
        let data = self.pngData()
        return data?.base64EncodedString()
    }

    /// base64转图片
    static func zz_base64(_ base64:String) -> UIImage?{
        guard let imageData = Data.init(base64Encoded: base64, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else { return nil }
        let image = UIImage.init(data: imageData)
        return image
    }

    /// 使用颜色绘制一张图片
    ///
    /// - Parameters:
    ///   - color: 将要绘制的图片颜色
    ///   - size: 将要绘制的图片大小 默认CGSize(width: 1, height: 1)
    /// - Returns: 绘制完成的颜色图片
    static func zz_image(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

    /// 截取View图片
    ///
    /// - Parameters:
    ///   - fromeView: view 窗体
    ///   - atFrame: 将要截图位置及大小
    /// - Returns: 截取的图片
    static func zz_snapshot(_ fromeView:UIView?, in frame:CGRect) -> UIImage? {
        if frame == .zero { return nil }
        guard let view = fromeView else { return nil }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.maxX, height: frame.maxY), false, 0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if frame.zz_x > 0 || frame.zz_y > 0 { // 剪切图片
            let imageRef = image?.cgImage
            if let subImgRef = imageRef?.cropping(to: frame){
                image = UIImage(cgImage: subImgRef)
            }
        }
        return image
    }
            
    /// 修改图片的颜色
    /// - Parameters:
    ///   - tintColor: 颜色
    ///   - blendMode: 模式 默认 .destinationIn
    /// - Returns:  修改后的图片
    func zz_image(tintColor:UIColor, blendMode: CGBlendMode = .destinationIn, alpha: CGFloat = 1) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        tintColor.setFill()
        let bounds = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: blendMode, alpha: alpha)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 图片修改成圆角
    func zz_roundCorner(_ byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGFloat) -> UIImage? {
        return zz_roundCorner(byRoundingCorners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
    }
    
    /// 图片修改成圆角
    func zz_roundCorner(_ byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        let reSizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return reSizeImage
    }
    
    /// 旋转 翻折图片
    /// - Parameter orientation: UIImage.Orientation
    /// - Returns: 处理后的图片
    func zz_image(orientation: UIImage.Orientation) -> UIImage{
        return UIImage(cgImage: cgImage!, scale: self.scale, orientation: orientation)
    }
    
    /// 水平翻转图片
    /// - Returns: 水平翻转 UIImage
    func zz_filp() -> UIImage {
        return zz_image(orientation: .upMirrored)
    }

    /// 向右旋转90° ⤼
    func zz_rotateRight90() -> UIImage{
        let image = UIImage(cgImage: self.cgImage!, scale: self.scale, orientation: UIImage.Orientation.right)
        return image
    }
    
    /// 等比率缩放
    /// - Parameter scaleSize: 比例 0~1
    /// - Returns: 图片
    func zz_scale(_ scaleSize: CGFloat) -> UIImage? {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return self.zz_resize(reSize)
    }
    
    /// 按照比例拉伸图片
    /// - Parameters:
    ///   - widthScale: 宽度拉伸比例点
    ///   - heightScale: 高度拉伸比例点
    /// - Returns: 新图片
    func zz_resizable(_ widthScale: CGFloat,_  heightScale: CGFloat) -> UIImage{
        let image = self.resizableImage(withCapInsets: UIEdgeInsets(top: self.size.height * heightScale,
                                                                    left: self.size.width  * widthScale,
                                                                    bottom: self.size.height  * heightScale,
                                                                    right: self.size.width  * widthScale),
                                        resizingMode: .stretch)
        return image
    }
    
    /// 根据图片宽度重置图片大小
    /// - Parameter width: 图片宽度
    /// - Returns: 图片
    func zz_resize_w(_ width: CGFloat) -> UIImage? {
        let height = self.size.height * width / self.size.width
        return self.zz_resize(CGSize(width: width, height: height))
    }
    
    /// 根据图片高度重置图片大小
    /// - Parameter height: 图片高度
    /// - Returns: 图片
    func zz_resize_h(_ height: CGFloat) -> UIImage? {
        let width = self.size.width * height / self.size.height
        return self.zz_resize(CGSize(width: width, height: height))
    }
    
    /// 重置图片大小 自动根据最大边长适配
    /// - Parameter maxWidthOrHeight: 图片最大边长
    /// - Returns: 图片
    func zz_resize(_ maxWidthOrHeight: CGFloat) -> UIImage? {
        if maxWidthOrHeight < self.size.width && maxWidthOrHeight < self.size.height {
            return self
        } else if self.size.width > self.size.height {
            return self.zz_resize_w( maxWidthOrHeight)
        } else if self.size.width < self.size.height {
            return self.zz_resize_h( maxWidthOrHeight)
        } else {
            return self.zz_resize(CGSize(width: maxWidthOrHeight, height: maxWidthOrHeight))
        }
    }
    
    /// 重设图片大小
    /// - Parameter reSize: 目标大小
    /// - Returns: 图片
    func zz_resize(_ reSize:CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(reSize, self.opaque, self.scale)
        self.draw(in: CGRect(origin: .zero, size: reSize))
        let reSizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return reSizeImage
    }
    
    /// 剪切图片
    /// - Parameter rect: 大小
    /// - Returns: 图片
    func zz_cropping(in rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, self.opaque, self.scale)
        self.draw(in: CGRect(x: -rect.origin.x, y: -rect.origin.y, width: self.size.width, height: self.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 生成一张二维码
    /// - Parameters:
    ///   - content: 内容
    ///   - size: 二维码大小
    ///   - onColor: 二维码高亮颜色
    ///   - offColor: 二维码背景色
    /// - Returns: 二维码
    static func zz_qrImage(_ content: String, size: CGSize = CGSize(100) , onColor: UIColor = .black, offColor: UIColor = .white) -> UIImage?{
        let stringData = content.data(using: .utf8)
        
        let qrFilter = CIFilter(name: "CIQRCodeGenerator")
        qrFilter?.setDefaults()
        qrFilter?.setValue(stringData, forKey: "inputMessage")
        //        qrFilter?.setValue("M", forKey: "inputCorrectionLevel")
        guard let outPutImage = qrFilter?.outputImage else { return nil }
        let colorFilter = CIFilter(name: "CIFalseColor",
                                   parameters: ["inputImage": outPutImage as Any,
                                                "inputColor0": CIColor(cgColor: onColor.cgColor),
                                                "inputColor1": CIColor(cgColor: offColor.cgColor)])
        guard let qrImage = colorFilter?.outputImage else { return nil }
        guard let cgImage = CIContext(options: nil).createCGImage(qrImage, from: qrImage.extent)  else { return nil }
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.interpolationQuality = .none
        context.scaleBy(x: 1.0, y: -1.0)
        context.draw(cgImage, in: context.boundingBoxOfClipPath)
        
        let codeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return codeImage
    }
    
    /// 压缩图片数据-不压尺寸
    ///
    /// - Parameters:
    ///   - maxLength: 最大长度
    /// - Returns:
    func zz_compress(_ maxLength: Int) -> Data? {
        guard let vData = self.jpegData(compressionQuality: 1) else { return nil }
//        ZZLog("压缩前kb: \( Double((vData.count)/1024))")
        if vData.count < maxLength {
            return vData
        }
        var compress:CGFloat = 0.9
        guard var data = self.jpegData(compressionQuality: compress) else { return nil }
        while data.count > maxLength && compress > 0.01 {
//            ZZLog("压缩比: \(compress)")
            compress -= 0.02
            data = self.jpegData(compressionQuality: compress)!
        }
//        ZZLog("压缩后kb: \(Double((data.count)/1024))")
        return data
    }
    
    /// 压缩图片
    ///
    /// - Parameter maxLength: 图片压缩后最大字节
    /// - Returns: 压缩后的图片Data
    func zz_compress_mid(_ maxLength: Int) -> Data? {
        var compression: CGFloat = 1
        guard var data = self.jpegData(compressionQuality: 1) else { return nil }
//        ZZLog("压缩前kb: \( Double((data.count) / 1024))")
        if data.count < maxLength {
            return data
        }
//        print("压缩前kb", data.count / 1024, "KB")
        var max: CGFloat = 1
        var min: CGFloat = 0
        for _ in 0 ..< 6 {
            compression = (max + min) / 2
            data = self.jpegData(compressionQuality: compression)!
            if CGFloat(data.count) < CGFloat(maxLength) * 0.9 {
                min = compression
            } else if data.count > maxLength {
                max = compression
            } else {
                break
            }
        }
        
//        print("压缩后kb", data.count / 1024, "KB")
        return data
    }
    
    /// 压缩图片
    ///
    /// - Parameter maxLength: 图片压缩后最大字节
    /// - Returns: 压缩后的图片
    func zz_compress_image(_ maxLength: Int) -> UIImage? {
        if let data = self.zz_compress_mid( maxLength){
            return UIImage(data: data)
        }
        return nil
    }
    
    
    /// 给图片打上 文字
    func zz_draw(text: String, attributed: [NSAttributedString.Key: Any], scale: CGFloat) -> UIImage {
        
        //重新计算字体大小
        var newAtt = attributed
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = 10
        newAtt[.paragraphStyle] = paragraphStyle
        //字体
        var font = newAtt[.font] as? UIFont
        if font == nil{
            font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
            newAtt[.font] = font
        }
        let drawText = NSString.init(string: text)
        let drawTextSize = drawText.size(withAttributes: newAtt)
        //字号
        let fontSize = font!.pointSize
        //需要显示的文字宽度
        let textShowSize = min(self.size.width, self.size.height) * scale
        
        // 将要绘制的字号
        let willFontSize = fontSize * textShowSize / drawTextSize.width
        newAtt[.font] = UIFont.systemFont(ofSize: willFontSize)
        let newDrawTextSize = drawText.size(withAttributes: newAtt)
        
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        self.draw(in: CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
//        for index in 0 ..< Int(self.size.height / newDrawTextSize.height) {
//            if index % 2 == 0 {
//                drawText.draw(at: CGPoint.init(x: 0, y: CGFloat(index) * newDrawTextSize.height), withAttributes: newAtt)
//            }
//        }
        
        drawText.draw(at: CGPoint.init(x: self.size.width * 0.01, y: self.size.height - newDrawTextSize.height - (self.size.height * 0.01)), withAttributes: newAtt)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}

//MARK: - GIF
public extension UIImage {

    class func zz_gif(data: Data) -> UIImage? {
        // Create source from data
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("SwiftGif: Source for the image does not exist")
            return nil
        }

        return UIImage.zz_animatedImageWithSource(source)
    }

    class func zz_gif(url: String) -> UIImage? {
        // Validate URL
        guard let bundleURL = URL(string: url) else {
            print("SwiftGif: This image named \"\(url)\" does not exist")
            return nil
        }

        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(url)\" into NSData")
            return nil
        }

        return zz_gif(data: imageData)
    }

    class func zz_gif(name: String) -> UIImage? {
        // Check for existance of gif
        guard let bundleURL = Bundle.main
          .url(forResource: name, withExtension: "gif") else {
            print("SwiftGif: This image named \"\(name)\" does not exist")
            return nil
        }

        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }

        return zz_gif(data: imageData)
    }

    @available(iOS 9.0, *)
    class func zz_gif(asset: String) -> UIImage? {
        // Create source from assets catalog
        guard let dataAsset = NSDataAsset(name: asset) else {
            print("SwiftGif: Cannot turn image named \"\(asset)\" into NSDataAsset")
            return nil
        }

        return zz_gif(data: dataAsset.data)
    }

    internal class func zz_delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1

        // Get dictionaries
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
        defer {
            gifPropertiesPointer.deallocate()
        }
        let unsafePointer = Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()
        if CFDictionaryGetValueIfPresent(cfProperties, unsafePointer, gifPropertiesPointer) == false {
            return delay
        }

        let gifProperties: CFDictionary = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)

        // Get delay time
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }

        if let delayObject = delayObject as? Double, delayObject > 0 {
            delay = delayObject
        } else {
            delay = 0.1 // Make sure they're not too fast
        }

        return delay
    }

    internal class func zz_gcdForPair(_ lhs: Int?, _ rhs: Int?) -> Int {
        var lhs = lhs
        var rhs = rhs
        // Check if one of them is nil
        if rhs == nil || lhs == nil {
            if rhs != nil {
                return rhs!
            } else if lhs != nil {
                return lhs!
            } else {
                return 0
            }
        }

        // Swap for modulo
        if lhs! < rhs! {
            let ctp = lhs
            lhs = rhs
            rhs = ctp
        }

        // Get greatest common divisor
        var rest: Int
        while true {
            rest = lhs! % rhs!

            if rest == 0 {
                return rhs! // Found it
            } else {
                lhs = rhs
                rhs = rest
            }
        }
    }

    internal class func zz_gcdForArray(_ array: [Int]) -> Int {
        if array.isEmpty {
            return 1
        }

        var gcd = array[0]

        for val in array {
            gcd = UIImage.zz_gcdForPair(val, gcd)
        }

        return gcd
    }

    internal class func zz_animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()

        // Fill arrays
        for index in 0..<count {
            // Add image
            if let image = CGImageSourceCreateImageAtIndex(source, index, nil) {
                images.append(image)
            }

            // At it's delay in cs
            let delaySeconds = UIImage.zz_delayForImageAtIndex(Int(index),
                source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }

        // Calculate full duration
        let duration: Int = {
            var sum = 0

            for val: Int in delays {
                sum += val
            }

            return sum
            }()

        // Get frames
        let gcd = zz_gcdForArray(delays)
        var frames = [UIImage]()

        var frame: UIImage
        var frameCount: Int
        for index in 0..<count {
            frame = UIImage(cgImage: images[Int(index)])
            frameCount = Int(delays[Int(index)] / gcd)

            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }

        // Heyhey
        let animation = UIImage.animatedImage(with: frames,
            duration: Double(duration) / 1000.0)

        return animation
    }

}
