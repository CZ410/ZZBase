//
//  String+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/29.
//

import Foundation
import UIKit
import CommonCrypto

public extension String{
    
    var zz_md5: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }
    
    /// base64编码
    var zz_base64Encoded: String? {
        let data = self.data(using: .utf8)
        return data?.base64EncodedString()
    }
    
    /// base64解码
    var zz_base64Decoded: String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    /// utf-8 Data
    var zz_utf8: Data?{
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        return data
    }
    
    /// 16进制字符串转Data
    var zz_hex: Data?{
        var data = Data(capacity: count / 2)
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        guard data.count > 0 else { return nil }
        return data
    }
    
    var zz_last: String{
        if self.count <= 0 { return self }
        return self.zz_sub(from: self.count - 1)
    }

    var zz_first: String{
        if self.count <= 0 { return self }
        return self.zz_sub(to: 1)
    }
    
    var zz_pinyin: String{
        let str = NSMutableString(string: self)
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformMandarinLatin, false)
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformStripDiacritics, false)
        let pinyin = str.capitalized
        return pinyin
    }
    
    var zz_formatJson: String {
        if (self.starts(with: "{") || self.starts(with: "[")){
            var level = 0
            var jsonFormatString = String()

            func getLevelStr(level:Int) -> String {
                var string = ""
                for _ in 0..<level {
                    string.append("\t")
                }
                return string
            }

            for char in self {
                if level > 0 && "\n" == jsonFormatString.last {
                    jsonFormatString.append(getLevelStr(level: level))
                }
                switch char {
                    case "{":
                        fallthrough
                    case "[":
                        level += 1
                        jsonFormatString.append(char)
                        jsonFormatString.append("\n")
                    case ",":
                        jsonFormatString.append(char)
                        jsonFormatString.append("\n")
                    case "}":
                        fallthrough
                    case "]":
                        level -= 1;
                        jsonFormatString.append("\n")
                        jsonFormatString.append(getLevelStr(level: level));
                        jsonFormatString.append(char);
                        break;
                    default:
                        jsonFormatString.append(char)
                }
            }
            return jsonFormatString;
        }

        return self
    }

    var zz_intValue: Int{
        if self.count == 0 {
            return 0
        }
        return Int(self) ?? 0
    }
    
    var zz_doubleValue: Double{
        return Double(self) ?? 0
    }
    
    var zz_floatValue: CGFloat {
        return CGFloat(Double(self) ?? 0)
    }
    
    
    /// 判断是否是小数
    var zz_isFloat: Bool {
        let scan : Scanner = Scanner(string: self)
        var val : Float = 0
        if #available(iOS 13.0, *) {
            return scan.scanHexFloat(&val) && scan.isAtEnd
        } else {
            return scan.scanFloat(&val) && scan.isAtEnd
        }
    }

    /// 计算是否是整数
    var zz_isInt: Bool {
        let flotvalue = Double(self)
        let intvalue = Int(flotvalue ?? 0)
        if Double(intvalue) == flotvalue {
            return true
        }
        return false
    }
    
    /// 判断是否是手机号码
    var zz_isPhone: Bool {
        /*
         移动号段
         139 138 137 136 134 135 147 150 151 152 157 158 159 172 178 182 183 184 187 188 195 197 198
         联通号段
         130 131 132 140 145 146 155 156 166 167 185 186 175 176
         电信号段
         133 149 153 177 173 180 181 189 191 199
         虚拟运营商号段
         162 165 170 171
        */
//        let phoneRegex = "^1(3[0-9]|4[0,5,6,7,9]|5[^4,\\D]|6[2,5,6,7]|7[^4,\\D]|8[0-9]|9[1,2,5,8,9])\\d{8}"
        let phoneRegex = "^1\\d{10}"
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }

    /// 是否是固话
    var zz_isTelPhone: Bool {
        let phoneRegex = "^(0\\d{2,3}-? ?\\d{7,8}$)"
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex)
        let isPhone1 = phonePredicate.evaluate(with: self)

        let phoneRegex2 = "^(\\d{7,8}$)"
        let phonePredicate2 = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex2)
        let isPhone2 = phonePredicate2.evaluate(with: self)

        if isPhone1 || isPhone2 {
            return true
        }
        return false
    }

    /// 判断是否是身份证号码
    var zz_isIdCard: Bool{

        let value = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        let length = value.count
        if length != 15 && length != 18 {
            return false
        }

        let areasArr = ["11","12", "13","14", "15","21", "22","23", "31","32", "33","34", "35","36", "37","41", "42","43", "44","45", "46","50", "51","52", "53","54", "61","62", "63","64", "65","71", "81","82", "91"]

        let valueStart2 = value.zz_sub(to: 2)
        var areaFlag = false
        for areaCode in areasArr {
            if areaCode == valueStart2{
                areaFlag = true
                break
            }
        }
        if !areaFlag { return false }

        var regularExpression: NSRegularExpression
        var numberofMatch: Int

        var year: Int = 0

        switch length {
            case 15:
                year = value.zz_sub(range: NSRange(location: 6, length: 2)).zz_intValue + 1900
                if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                    //测试出生日期的合法性
                    regularExpression = try! NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: .caseInsensitive)
                }else{
                    //测试出生日期的合法性
                    regularExpression = try! NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: .caseInsensitive)
                }
                numberofMatch = regularExpression.numberOfMatches(in: value, options: .reportProgress, range: NSMakeRange(0, value.count))
                if numberofMatch > 0 {
                    return true
                }
                return false
            case 18:
                year = value.zz_sub(range: NSRange(location: 6, length: 4)).zz_intValue
                if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                    //测试出生日期的合法性
                    regularExpression = try! NSRegularExpression.init(pattern: "^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$", options: .caseInsensitive)
                }else{
                    //测试出生日期的合法性
                    regularExpression = try! NSRegularExpression.init(pattern: "^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$", options: .caseInsensitive)
                }
                numberofMatch = regularExpression.numberOfMatches(in: value, options: .reportProgress, range: NSMakeRange(0, value.count))
                if numberofMatch > 0 {
                    //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
                    let S = value.zz_sub(range: NSMakeRange(0, 1)).zz_intValue * 7 +
                        value.zz_sub(range: NSMakeRange(10, 1)).zz_intValue * 7 +
                        value.zz_sub(range: NSMakeRange(1, 1)).zz_intValue * 9 +
                        value.zz_sub(range: NSMakeRange(11, 1)).zz_intValue * 9 +
                        value.zz_sub(range: NSMakeRange(2, 1)).zz_intValue * 10 +
                        value.zz_sub(range: NSMakeRange(12, 1)).zz_intValue * 10 +
                        value.zz_sub(range: NSMakeRange(3, 1)).zz_intValue * 5 +
                        value.zz_sub(range: NSMakeRange(13, 1)).zz_intValue * 5 +
                        value.zz_sub(range: NSMakeRange(4, 1)).zz_intValue * 8 +
                        value.zz_sub(range: NSMakeRange(14, 1)).zz_intValue * 8 +
                        value.zz_sub(range: NSMakeRange(5, 1)).zz_intValue * 4 +
                        value.zz_sub(range: NSMakeRange(15, 1)).zz_intValue * 4 +
                        value.zz_sub(range: NSMakeRange(6, 1)).zz_intValue * 2 +
                        value.zz_sub(range: NSMakeRange(16, 1)).zz_intValue * 2 +
                        value.zz_sub(range: NSMakeRange(7, 1)).zz_intValue * 1 +
                        value.zz_sub(range: NSMakeRange(8, 1)).zz_intValue * 6 +
                        value.zz_sub(range: NSMakeRange(9, 1)).zz_intValue * 3


                    //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字
                    let Y = S % 11
                    var M = "F"
                    let JYM = "10X98765432"

                    M = JYM.zz_sub(range: NSMakeRange(Y, 1))

                    let lastString = value.zz_sub(range: NSMakeRange(17, 1))
                    if lastString == "x" {
                        if M == "X" {
                            return true
                        }else {
                            return false
                        }
                    }else{
                        if M == value.zz_sub(range: NSMakeRange(17, 1)) {
                            return true
                        }else{
                            return false
                        }
                    }
                }
                return false
            default: return false
        }
    }
    
    ///判断是否是6位验证码
    var zz_isCode_6: Bool{
        let phoneRegex = "\\d{6}"
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    
    /// 是否是IP地址
    var zz_isIP: Bool{
        let pattern = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: self)
        return isMatch;
    }

    /// 判断是否是邮箱
    var zz_isEmail:Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: self)
        return isMatch;
    }

    /// 判断是否是中文
    var zz_isChinese:Bool {
        let pattern = "^[a-zA-Z\\u4E00-\\u9FA5]{1,20}"
        let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch:Bool = pred.evaluate(with: self)
        return isMatch;
    }

    /// 判断是否是链接
    var zz_isURL:Bool {
        let url = URL(string: self)
        return url != nil
    }
    
    /// 版本号比对 当相同时候也返回 true
    func zz_Lager(than version: String) -> Bool{
        return zz_Lager(version: version) != .orderedAscending
    }
    
    /// 版本号比对
    func zz_Lager(version: String) -> ComparisonResult{
        if (isEmpty) {
            /// 当前版本是空 直接返回false
            return .orderedAscending
        }
        
        if (version.isEmpty) {
            /// 新版本是空 直接返回true
            return .orderedDescending
        }
        
        let currentVersion = self;
        // 假设有一个新的版本号 "2.0.0" 需要与当前版本号比较
        let newVersion = version;
        
        // 将版本号字符串转换为数字数组
        let currentVersionParts = currentVersion.components(separatedBy: ".").compactMap({Int($0)})
        let newVersionParts = newVersion.components(separatedBy: ".").compactMap({Int($0)})
        
        for i in 0 ..< currentVersionParts.count {
            if (i >= newVersionParts.count) {
                // 新版本号短于当前版本号，当前版本号更大
                return .orderedDescending
            }
            if (currentVersionParts[i] > newVersionParts[i]) {
                // 当前版本号的这一部分更大
                return .orderedDescending
            } else if (currentVersionParts[i] < newVersionParts[i]) {
                // 新版本号的这一部分更大
                return .orderedAscending
            } else if (i == currentVersionParts.count - 1 && currentVersionParts.count == newVersionParts.count) {
                // 版本号长度相同且全部部分都相同
                return .orderedSame
            }
        }
        
        return .orderedAscending
    }
}

//MARK: - Function
public extension String{
    
    /// 计算文字的Size
    /// - Parameters:
    ///   - font: 字体
    ///   - maxSize: maxSize >= 计算完成的Size；
    /// - Returns: 计算完成的文字Size
    func zz_textSize(font: UIFont, maxSize: CGSize) -> CGSize{
        if self.count == 0 { return CGSize.zero }
        let textStr : NSString = self as NSString
        var textSize = CGSize.zero
        if maxSize == CGSize.zero {
            let stringStyle = NSMutableDictionary()
            stringStyle.setObject(font, forKey: kCTFontAttributeName as! NSCopying)
            textSize = textStr.size(withAttributes: stringStyle as? [NSAttributedString.Key : Any])
        }else{
            let stringStyle = NSMutableDictionary()
            stringStyle.setObject(font, forKey: kCTFontAttributeName as! NSCopying)
            let rect = textStr.boundingRect(with: maxSize,
                                            options: [.usesLineFragmentOrigin,.usesFontLeading,.truncatesLastVisibleLine],
                                            attributes: stringStyle as? [NSAttributedString.Key : Any], context: nil)
            textSize = rect.size
        }
        textSize = CGSize(width: CGFloat(ceilf(Float(textSize.width))),
                          height: CGFloat(ceilf(Float(textSize.height))))//用进一发取整
        return textSize
    }
    
    func zz_sub(from index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            
            return String(subString)
        } else {
            return self
        }
    }
    
    func zz_sub(to index: Int) -> String {
        if self.count > index {
            let endIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[self.startIndex..<endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    
    func zz_sub(range index: NSRange) -> String {
        if self.count > index.length {
            let startIndex = self.index(self.startIndex, offsetBy: index.location)
            let endIndex = self.index(self.startIndex, offsetBy: index.location + index.length)
            let subString = self[startIndex..<endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    
    func zz_sub(from: Int, length: Int) -> String {
        return zz_sub(range: NSRange(location: from, length: length))
    }
    
    func zz_hidden(range index: NSRange, replace: String = "*") -> String {
        if self.count > (index.length + index.location) {
            var toStr = self.zz_sub(to: index.location)
            let fromStr = self.zz_sub(from: index.location + index.length)
            for _ in 0 ..< index.length{
                toStr.append(replace)
            }
            return "\(toStr)\(fromStr)"
        } else {
            return self
        }
    }
    
    
    /// 替换length之后文本
    /// - Parameters:
    ///   - lenght: 需要显示的文本长度
    ///   - toString: 替换文本
    /// - Returns: 新字符串
    func zz_replace(from index: Int, to toString:String = "") -> String{
        if self.count <= index {
            return self
        }
        let text = self.zz_sub(to: index)
        return "\(text)\(toString)"
    }
    
    /// 将字符串每隔数位用分割符隔开 如将【123456】分割成【123,456】
    /// - Parameters:
    ///   - gap: 相隔位数，默认为3
    ///   - seperator: 分割符，默认为逗号
    /// - Returns: 用指定分隔符每隔指定位数隔开的字符串
    func zz_partition(gap: Int = 3, seperator: Character = ",") -> String {
        let count = self.count
        let sepNum = Int(ceil(CGFloat(count) / CGFloat(gap)))
        guard sepNum > 1 else {  return self }
        var temp = self
        for i in 0..<sepNum{
            let index = (i + 1) * gap + i
            if index >= temp.count { break }
            temp.insert(seperator, at: temp.index(temp.startIndex, offsetBy: index))
        }
        return temp
    }
    
    /// 判断字符位数是否在区间内
    func zz_isLength(min:Int, max:Int)  -> Bool{
        let phoneRegex = "\\w{\(min),\(max)}"
        let phonePredicate = NSPredicate.init(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self)
    }
    
}

//MARK: - HTML
public extension String{
    
    
    /// 添加HTML结构
    var zz_addHtml: String{
        get{
            return "<html><head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'><style>*{ width: 100%; margin: 0; padding: 0 3; box-sizing: border-box;} img{ width: 100%;}</style></head><body>\(self)</body></html>"
        }
    }
    
    ///  将字符串转换成HTML富文本
    /// - Parameters:
    ///   - font: 字体
    ///   - lineSpacing: 行高
    /// - Returns: 富文本
    func zz_htmlAttri(font: UIFont? = UIFont.systemFont(ofSize: 16), lineSpacing: CGFloat? = 10) -> NSMutableAttributedString {
        var htmlString: NSMutableAttributedString? = nil
        do {
            if let data = self.replacingOccurrences(of: "\n", with: "<br/>").data(using: .utf8) {
                htmlString = try NSMutableAttributedString(data: data, options: [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: NSNumber(value: String.Encoding.utf8.rawValue)], documentAttributes: nil)
                let wrapHtmlString = NSMutableAttributedString(string: "\n")
                // 判断尾部是否是换行符
                if let weakHtmlString = htmlString, weakHtmlString.string.hasSuffix("\n") {
                    htmlString?.deleteCharacters(in: NSRange(location: weakHtmlString.length - wrapHtmlString.length, length: wrapHtmlString.length))
                }
            }
        } catch {
        }

        // 设置富文本字的大小
        if let font = font {
            htmlString?.addAttributes([
            NSAttributedString.Key.font: font], range: NSRange(location: 0, length: htmlString?.length ?? 0))
        }

        // 设置行间距
        if let weakLineSpacing = lineSpacing {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = weakLineSpacing
            htmlString?.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: htmlString?.length ?? 0))
        }
        return htmlString ?? NSMutableAttributedString(string: self)
    }
}


// MARK: - UI
public extension String{
    func zz_toLabel(_ font: UIFont? = nil) -> UILabel {
        let label = UILabel().zz_text(self)
        if let font = font {
            label.zz_font(font)
        }
        return label
    }
    
    func zz_toButton(_ type: UIButton.ButtonType = .custom, font: UIFont? = nil) -> UIButton {
        let button = UIButton(type: type)
        button.setTitle(self, for: .normal)
        if let font = font {
            button.titleLabel?.zz_font(font)
        }
        return button
    }
}
