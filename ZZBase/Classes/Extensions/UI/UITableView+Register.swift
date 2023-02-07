//
//  UITableView+Register.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import UIKit

public extension UITableView{
    
    @discardableResult
    func zz_register<T>(cell cellClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UITableViewCell{
        guard let nib_name = nibName else {
            self.register(cellClass, forCellReuseIdentifier: identifier )
            return self
        }
        self.register(UINib(nibName: nib_name, bundle: nil), forCellReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func zz_register<T>(headerFooter cellClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UITableViewHeaderFooterView{
        guard let nib_name = nibName else {
            self.register(cellClass, forHeaderFooterViewReuseIdentifier: identifier )
            return self
        }
        self.register(UINib(nibName: nib_name, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    
    func zz_cell(_ style:UITableViewCell.CellStyle = .default, initBlock: ((_ cell: UITableViewCell) -> Void)? = nil) -> UITableViewCell {
        let cell = self.zz_cell(identifier: "ZZUITableViewCell_Default",
                              cellClass: UITableViewCell.self,
                              style: style,
                              initBlock: { (init_cell) in
                                initBlock?(init_cell)
        })
        return cell
    }
    
    func zz_cell<T: UITableViewCell>(identifier: String = "\(NSStringFromClass(T.self))_identifier",
                  cellClass:T.Type,
                  for indexPath: IndexPath) -> T{
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        return cell
    }
    
    func zz_cell<T: UITableViewCell>(identifier: String = "\(NSStringFromClass(T.self))_identifier",
                  cellClass:T.Type,
                  style:UITableViewCell.CellStyle = .default,
                  initBlock:((_ cell:T) -> Void)? = nil) -> T{
        var cell = self.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = cellClass.init(style: style, reuseIdentifier: identifier)
            if initBlock != nil { initBlock!(cell as! T) }
        }
        return cell as! T
    }

    func zz_headerFooter<T: UITableViewHeaderFooterView>(identifier: String = "\(NSStringFromClass(T.self))HeaderFooter_identifier",
        headerFooterClass: T.Type,
        initBlock:((_ cell:T) -> Void)? = nil) -> T{
        var view = self.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        if view == nil {
            view = headerFooterClass.init(reuseIdentifier: identifier)
            if initBlock != nil { initBlock!(view as! T) }
        }
        return view as! T
    }
}
