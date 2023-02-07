//
//  Dictionary+ZZ.swift
//  ZZBase
//
//  Created by 陈钟 on 2019/5/31.
//  Copyright © 2019 陈钟. All rights reserved.
//

import Foundation

public extension Dictionary{
    
    mutating func zz_append(dic:Dictionary) -> Void {
        for (dicKey,dicValue) in dic {
            self[dicKey] = dicValue
        }
    }
    
    var zz_allKeys: [Key] {
        let ks = Array(self.keys)
        return ks as [Key]
    }
}
