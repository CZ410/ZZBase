//
//  UIImageView+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import UIKit

public extension UIImageView {
    
    func zz_gif(name: String) {
        DispatchQueue.global().async {
            let image = UIImage.zz_gif(name: name)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    @available(iOS 9.0, *)
    func zz_gif(asset: String) {
        DispatchQueue.global().async {
            let image = UIImage.zz_gif(asset: asset)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    

}
