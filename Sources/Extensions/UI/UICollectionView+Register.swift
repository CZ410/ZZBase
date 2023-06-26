//
//  UICollectionView+Register.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import UIKit

public extension UICollectionView{
    
    @discardableResult func zz_register<T>(cell cellClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UICollectionViewCell{
        guard let nib_name = nibName else {
            self.register(cellClass, forCellWithReuseIdentifier: identifier)
            return self
        }
        self.register(UINib(nibName: nib_name, bundle: nil), forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult func zz_register<T>(header headerClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UICollectionReusableView{
        guard let nib_name = nibName else {
            self.register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
            return self
        }
        self.register(UINib(nibName: nib_name, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult func zz_register<T>(footer headerClass: T.Type, nibName: String? = nil, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> Self where T: UICollectionReusableView{
        guard let nib_name = nibName else {
            self.register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
            return self
        }
        self.register(UINib(nibName: nib_name, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
        return self
    }

    func zz_cell<T: UICollectionViewCell>(_ identifier: String = "\(NSStringFromClass(T.self))_identifier",
                 cellClass: T.Type,
                 indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell as! T
    }
    
    func zz_dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, withReuseIdentifier identifier: String = "\(NSStringFromClass(T.self))_identifier", for indexPath: IndexPath, classType: T.Type) -> T{
        return self.dequeueReusableSupplementaryView(ofKind: elementKind,
                                                     withReuseIdentifier: identifier,
                                                     for: indexPath) as! T
    }

    func zz_header<T: UICollectionReusableView>(_ classType: T.Type, for indexPath: IndexPath, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> T{
        return self.zz_dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                     withReuseIdentifier: identifier,
                                                     for: indexPath,
                                                     classType: classType)
    }

    func zz_footer<T: UICollectionReusableView>(_ classType: T.Type, for indexPath: IndexPath, identifier: String = "\(NSStringFromClass(T.self))_identifier") -> T{
        return self.zz_dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                     withReuseIdentifier: identifier,
                                                     for: indexPath,
                                                     classType: classType)
    }
}

