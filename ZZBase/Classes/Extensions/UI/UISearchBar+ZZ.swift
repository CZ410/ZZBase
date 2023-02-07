//
//  UISearchBar+ZZ.swift
//  ZZBase
//
//  Created by 陈钟 on 2020/3/27.
//  Copyright © 2020 陈钟. All rights reserved.
//

import Foundation
import UIKit

public extension UISearchBar{
    var textField: UITextField{
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            let searchTf: UITextField = self.value(forKey: "_searchField") as! UITextField
            return searchTf
        }
    }
}
