//
//  DispatchQueue+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/4.
//

import Foundation

public extension DispatchQueue{
    private static var _onceToken: [String] = []
    class func zz_once(token: String = "\(#file):\(#function):\(#line)", block: ()->Void) {
        objc_sync_enter(self)
        defer
        {
            objc_sync_exit(self)
        }
        if _onceToken.contains(token)
        {
            return
        }
        _onceToken.append(token)
        block()
    }
}
