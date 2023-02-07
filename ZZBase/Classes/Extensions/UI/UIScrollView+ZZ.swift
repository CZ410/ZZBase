//
//  UIScrollView+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import UIKit

public extension UIScrollView{
    
    func zz_scrollToTop(animated: Bool = true){
        let offset = self.contentOffset.zz_y(0 - self.contentInset.top)
        self.setContentOffset(offset, animated: animated)
    }
    
    func zz_scrollToBottom(animated: Bool = true){
        let offset = self.contentOffset.zz_y(self.contentSize.height - self.zz_height + self.contentInset.bottom)
        self.setContentOffset(offset, animated: animated)
    }
    
    func zz_scrollToLeft(animated: Bool = true){
        let offset = self.contentOffset.zz_y(0 - self.contentInset.left)
        self.setContentOffset(offset, animated: animated)
    }
    
    func zz_scrollToRight(animated: Bool = true){
        let offset = self.contentOffset.zz_y(self.contentSize.width - self.zz_height + self.contentInset.right)
        self.setContentOffset(offset, animated: animated)
    }
}
