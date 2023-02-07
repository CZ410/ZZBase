//
//  UIDevice+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation
import UIKit

public extension UIDevice{
    
    /// UUID
    static var zz_uuid: String{
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    /// 用户手机别名
    static var zz_phoneName: String{
        return UIDevice.current.name
    }
    
    /// 设备名称
    static var zz_systemName: String {
        return UIDevice.current.systemName
    }

    /// 设备系统版本
    static var zz_systemVersion: String {
        return UIDevice.current.systemVersion
    }

    /// 是否是iPhone X
    static var zz_isIPhoneX: Bool {
        var isIPhoneX : Bool = false
        if #available(iOS 11.0, *) {
            isIPhoneX = (zz_keyWindow?.safeAreaInsets.bottom ?? 0) > 0
        }
        return isIPhoneX;
    }

    /// 是否是 iphone5 及以下
    static var zz_isIphone5OrLess: Bool {
        return (zz_isIPhoneX && zz_screen_max_length <= 568.0)
    }

    /// 是否是iPad
    static var zz_isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    /// 是否是iPhone
    static var zz_isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    /// 是否是暗黑模式
    static var zz_isDarkModel: Bool{
        if #available(iOS 13, *) {
            return UITraitCollection.current.userInterfaceStyle == .dark
        } else {
            return false
        }
    }
    
    /// 是否是Retina
    static var zz_isRetina: Bool {
        return UIScreen.main.scale >= 2
    }
    
    /// 是否是模拟器
    static var zz_isSimuLator: Bool{
        return (TARGET_IPHONE_SIMULATOR == 1 && TARGET_OS_IPHONE == 1)
    }
}

//MARK: - Disk Space
public extension UIDevice{
    
    /// 设备磁盘
    static func zz_disk(_ key: FileAttributeKey) -> String?{
        guard let attrs = try?FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else {
            return nil
        }
        guard let space = attrs[key] else { return nil }
        return "\(space)"
    }
    
    /// 设备总磁盘空间
    static var zz_diskSpace: Int {
        guard let space = zz_disk(FileAttributeKey.systemSize) else {
            return 0
        }
        return Int(space) ?? 0
    }
    
    /// 设备剩余磁盘空间
    static var zz_diskSpaceFree: Int {
        guard let space = zz_disk(FileAttributeKey.systemFreeSize) else {
            return 0
        }
        return Int(space) ?? 0
    }
    
    /// 设备已用磁盘空间
    static var zz_diskSpaceUsed: Int {
        let total = self.zz_diskSpace
        let free = self.zz_diskSpaceFree
        let used = total - free
        if used < 0 { return 0 }
        return used
    }
}
