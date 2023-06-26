//
//  UIApplication+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import UIKit

public extension UIApplication{
    
    /// "Documents" folder in this app's sandbox.
    static var zz_document_url: URL?{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    }
    
    static var zz_document_path: String{
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
    }
    
    /// "Caches" folder in this app's sandbox.
    static var zz_caches_url: URL?{
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).last
    }
    
    static var zz_caches_path: String{
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
    }
    
    /// "Library" folder in this app's sandbox.
    static var zz_library_url: URL?{
        return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last
    }
    
    static var zz_library_path: String{
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? ""
    }
}
