//
//  NSObject+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/3.
//

import Foundation

public extension NSObject{
    func zz_objc_set(key: String, _ newValue: Any?,_ policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC){
        let `key`: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: key.hashValue)
        objc_setAssociatedObject(self, key, newValue, policy)
    }

    func zz_objc_get<T>( key: String, _ type: T.Type) -> T?{
        let `key`: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: key.hashValue)
        let obj = objc_getAssociatedObject(self, key)
        return obj as? T
    }
}

