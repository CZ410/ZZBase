//
//  Bundle+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2022/12/30.
//

import Foundation

public extension Bundle{
    
    /// APP名字
    static var zz_bundleName: String {
        let appversion = Bundle.main.infoDictionary?["CFBundleName"] as? String
        return appversion ?? ""
    }
    
    /// APP BundleIdentifier e.g. "com.ibireme.MyApp"
    static var zz_bundleID: String {
        let appversion = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
        return appversion ?? ""
    }
    
    /// APP版本
    static var zz_appVersion: String {
        let appversion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return appversion ?? ""
    }
    
    /// APP Build
    static var zz_appBuild: String {
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        return build ?? ""
    }
    
    /// 是否有新版本号
    static var zz_isNewFeature: Bool {
        let versionKey = "bundle_versionKey"
        let newVersion = zz_appVersion
        let oldVersion = UserDefaults.standard.value(forKey: versionKey) as? String
        if oldVersion == nil || oldVersion! != newVersion {
            //将新版本存起来
            UserDefaults.standard.setValue(newVersion, forKey: versionKey)
            return true
        }
        return false
    }

}
