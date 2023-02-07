//
//  ZZHelper.swift
//  ZZBase
//
//  Created by Czz on 2022/12/29.
//

import Foundation
import UIKit

/// Keywindow
public var zz_keyWindow: UIWindow? {
    if #available(iOS 13.0, *) {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let sceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = sceneDelegate.window else {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            return window
        }
        return window
    } else {
        return UIApplication.shared.keyWindow
    }
}

/// 屏幕宽度
public var zz_screen_width: CGFloat {
    return UIScreen.main.bounds.size.width
}

/// 屏幕高度
public var zz_screen_height: CGFloat {
    return UIScreen.main.bounds.size.height
}

/// 屏幕最大边
public var zz_screen_max_length: CGFloat {
    return max(zz_screen_width, zz_screen_height)
}

/// 屏幕最小边
public var zz_screen_min_length: CGFloat {
    return min(zz_screen_width, zz_screen_height)
}

/// 最小边的比例
public var zz_screen_min_scale: CGFloat {
    return zz_screen_min_length / CGFloat(375)
}

/// 状态栏高度
public var zz_statusBarHeight: CGFloat {
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        return height
    } else {
        return UIApplication.shared.statusBarFrame.size.height
    }
}

/// navigationBar 高度
public let zz_navBarHeight: CGFloat = zz_statusBarHeight + 44

/// iphonex 下方多出高度
public let zz_safeAreaHeight: CGFloat = UIDevice.zz_isIPhoneX ? 34.0 : 0.0

/// TabBar 高度
public let zz_tabBarHeight: CGFloat = 49.0 + zz_safeAreaHeight

//MARK: - 文件路径
/// bundle
public func zz_file_bundle(_ name: String,type: String) -> String? {
    return Bundle.main.path(forResource: name, ofType: type)
}

/// documents filename
public func zz_file_documents(_ filename: String = "") -> String {
    var file_path = NSHomeDirectory() + "/Documents"
    if filename.count > 0 { file_path.append("/") }
    file_path.append(filename)
    return file_path
}

/// 将字符串转换成URL
public func zz_url(_ urlString:String?) -> URL? {
    if let urlData =  urlString?.data(using: .utf8){
        return URL(dataRepresentation: urlData, relativeTo: nil)
    }
    return nil
}

/// 字符串转 文件路径URL
public func zz_url(file string:String?) -> URL? {
    if let fileUrl = string{
        return URL.init(fileURLWithPath: fileUrl)
    }
    return nil
}

//MARK: - LOG
public func ZZLog<T>(_ message:T,file:String = #file,funcName:String = #function,lineNum:Int = #line) {
    #if DEBUG
    // 设置在DEBUG 环境下打印LOG ， DEBUG就是在Build Settings 里面设置的标识。
    // 1.获取打印所在的文件
    let file = (file as NSString).lastPathComponent
//    //2.获取打印所在的方法
//    let funcName = funcName
    //3.获取打印所在的行
    let lineNum = lineNum
//    print("\(file) (\(lineNum)) \(funcName) : \(message)")
    print("\(file) (\(lineNum)): \(message)")
    #endif
}

public class ZZBase{
    //MARK: - 非空判断
    /// 判断字符串是否为空
    public static func zz_isNull(_ text: String?) -> Bool {
        if text == nil { return true }
        if text!.count <= 0 { return true }
        return false
    }
    
    //MARK: - 公用方法
    /// 跳转App Store 评论界面
    public static func zz_jumpToAppStore(_ appid: String) -> Void {
        var urlStr = "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=\(appid)"
        if #available(iOS 11.0, *) {
            urlStr = "itms-apps://itunes.apple.com/us/app/id\(appid)?mt=8&action=write-review"
        }
        guard let url = zz_url(urlStr) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    /// 通过Safari 打开网址
    /// - Parameter urlStr: 网址
    public static func zz_openURL(_ urlStr: String?){
        guard let url = zz_url(urlStr) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    /// 拨打电话
    /// - Parameter phone: 电话号码
    public static func zz_call(_ phone: String) -> Void {
        if let phoneUrl:URL = URL.init(string: "tel:\(phone)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(phoneUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(phoneUrl)
            }
        }
    }
    
    //MARK: - JSON
    /// 对象转json字符串
    /// - Parameter json: json对象
    public static func zz_jsonString(_ json: Any?) -> String?{
        guard let json = json else { return nil }
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: []) else { return nil}
        return String(data: data, encoding: .utf8)
    }
    
    /// 字符串转字典或者数组
    /// - Parameters:
    ///   - jsonString: json字符串
    public static func zz_jsonValue(_ jsonString: String?) -> Any?{
        guard let json = jsonString else { return nil }
        guard let data = json.data(using: .utf8) else { return nil }
        let value = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        return value
    }
    
    /// 将Codable data转成model
    /// - Parameters:
    ///   - type: 模型类型
    ///   - json: json data
    public static func zz_jsonDecode<T>(_ type: T.Type, json: Data?) -> T? where T : Decodable{
        guard let json = json else { return nil }
        guard let obj = try? JSONDecoder().decode(type, from: json) else { return nil }
        return obj
    }
    
    
    /// 将Codable 字典转成model
    /// - Parameters:
    ///   - type: 模型类型
    ///   - json: json data
    public static func zz_jsonDecode<T>(_ type: T.Type, json: Any?) -> T? where T : Decodable{
        var jsonObj = json
        if json is String {
            jsonObj = zz_jsonValue(json as? String)
        }
        guard let jsonObj = jsonObj else { return nil }
        let data = try? JSONSerialization.data(withJSONObject: jsonObj, options: [])
        return self.zz_jsonDecode(type, json: data)
    }
    
    /// 将Codable 模型转换成json字符串
    /// - Parameter model: 模型
    public static func zz_jsonEncoder<T>(_ model: T?) -> String? where T : Encodable{
        guard let model = model,
              let data = try? JSONEncoder().encode(model),
              let json = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        return json
    }
}
